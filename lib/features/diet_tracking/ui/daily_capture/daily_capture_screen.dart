import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/models.dart';
import '../../providers/daily_log_notifier.dart';
import '../../providers/food_catalog_provider.dart';
import 'package:comosano/core_backend_services/07_routes/app_routes.dart';
import 'package:comosano/core_backend_services/20_var_globales/var_color_themes.dart';
import 'package:comosano/core_backend_services/20_var_globales/variables_globales.dart';

class DailyCaptureScreen extends ConsumerStatefulWidget {
  final DateTime date;

  const DailyCaptureScreen({super.key, required this.date});

  @override
  ConsumerState<DailyCaptureScreen> createState() => _DailyCaptureScreenState();
}

class _DailyCaptureScreenState extends ConsumerState<DailyCaptureScreen> {
  String _searchQuery = "";
  String _selectedCategory = "Todo";
  final ScrollController _categoryScrollController = ScrollController();

  @override
  void dispose() {
    _categoryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catalogAsync = ref.watch(foodCatalogProvider(null));
    final dailyLog = ref.watch(dailyLogProvider(widget.date));

    return Scaffold(
      appBar: AppBar(
        title: Text("Día: ${DateFormat('dd MMM yyyy').format(widget.date)}"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "${dailyLog.totalPercentage.toStringAsFixed(0)}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeTituloPagina,
                  color: dailyLog.totalPercentage > 100 ? appTheme.error : null,
                ),
              ),
            ),
          ),
        ],
      ),
      body: catalogAsync.when(
        data: (catalog) {
          final categories = _extractCategories(catalog);

          final filteredItems = catalog.where((item) {
            final matchesSearch = item.name.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
            final matchesCategory =
                _selectedCategory == "Todo" ||
                item.category == _selectedCategory;
            return matchesSearch && matchesCategory;
          }).toList();

          return Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar alimento...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: appTheme.surfaceContainerHighest,
                  ),
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                ),
              ),
              // Category Selector
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _categoryScrollController,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _categoryScrollController,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: categories.map((cat) {
                        final isSelected = _selectedCategory == cat;
                        final catColor = _categoryColor(cat);
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(
                              cat,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                            selected: isSelected,
                            selectedColor: catColor.withValues(alpha: 0.8),
                            backgroundColor: catColor.withValues(alpha: 0.6),
                            labelStyle: TextStyle(
                              color: appTheme.shadow,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                            ),
                            side: BorderSide(
                              color: catColor.withValues(alpha: 0.9),
                            ),
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedCategory = cat;
                                });
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const Divider(),
              // Food List
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text("${item.portion} • ${item.category}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (item.isFree)
                            Chip(
                              label: const Text(
                                "Libre",
                                style: TextStyle(fontSize: 10),
                              ),
                              backgroundColor: appTheme.tertiaryContainer,
                            )
                          else
                            ...item.colorPoints.entries.map(
                              (e) => _buildColorDot(e.key, e.value),
                            ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: appTheme.primary,
                            ),
                            onPressed: () {
                              ref
                                  .read(dailyLogProvider(widget.date).notifier)
                                  .addFoodEntry(item);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${item.name} agregado"),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text("Error cargando catálogo: $e")),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoutes.consumedFoods,
          arguments: widget.date,
        ),
        icon: const Icon(Icons.restaurant),
        label: Text("Consumido (${dailyLog.consumedFoods.length})"),
      ),
    );
  }

  Color _categoryColor(String category) {
    final palette = [
      Colors.red,
      Colors.orange,
      Colors.amber,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.brown,
      Colors.blueGrey,
      Colors.deepOrange,
      Colors.lime,
      Colors.cyan,
    ];
    final index = category.hashCode.abs() % palette.length;
    return palette[index];
  }

  List<String> _extractCategories(List<FoodCatalogItem> catalog) {
    final Set<String> cats = {"Todo"};
    for (var item in catalog) {
      cats.add(item.category);
    }
    return cats.toList()..sort();
  }

  Widget _buildColorDot(String colorString, int points) {
    Color dotColor;
    switch (colorString.toLowerCase()) {
      case 'red':
        dotColor = Colors.red;
        break;
      case 'yellow':
        dotColor = Colors.yellow;
        break;
      case 'green':
        dotColor = Colors.green;
        break;
      case 'blue':
        dotColor = Colors.blue;
        break;
      case 'orange':
        dotColor = Colors.orange;
        break;
      case 'purple':
        dotColor = Colors.purple;
        break;
      case 'pink':
        dotColor = Colors.pink;
        break;
      default:
        dotColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: dotColor.withValues(alpha: 0.2),
        border: Border.all(color: dotColor, width: 1.5),
        shape: BoxShape.circle,
      ),
      child: Text(
        points.toString(),
        style: TextStyle(
          color: appTheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: fontSizeSubtituloPagina + 2,
        ),
      ),
    );
  }

}
