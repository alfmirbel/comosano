import 'package:comosano/core_backend_services/60_global_widgets/debugprint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import 'package:comosano/core_backend_services/20_var_globales/var_color_themes.dart';
import 'package:comosano/core_backend_services/20_var_globales/variables_globales.dart';
import 'package:comosano/core_backend_services/10_user_login/usuario_login/provider_session.dart';
import 'package:comosano/features/diet_tracking/providers/food_catalog_provider.dart';
import 'package:comosano/features/diet_tracking/repositories/food_catalog_repository.dart';

import '../../../../core_backend_services/10_user_login/data_models/auth_state.dart';
import '../../../../core_backend_services/20_var_globales/app_keys.dart';
import '../../models/models.dart';

class PersonalFoodsScreen extends ConsumerStatefulWidget {
  const PersonalFoodsScreen({super.key});

  @override
  ConsumerState<PersonalFoodsScreen> createState() =>
      _PersonalFoodsScreenState();
}

class _PersonalFoodsScreenState extends ConsumerState<PersonalFoodsScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _portionCtrl = TextEditingController();
  final TextEditingController _weightCtrl = TextEditingController();

  String _selectedCategory = 'Otros';
  bool _isFree = false;

  final List<String> _allCategories = <String>[
    'Otros',
    'DESAYUNO',
    'COMIDA',
    'CENA',
    'BEBIDAS',
    'FRUTAS',
    'VERDURAS',
    'LÁCTEOS',
    'CEREALES',
    'PROTEÍNAS',
    'SNACKS',
    'ENSALADAS',
    'SOPAS',
    'POSTRES',
    'CONDIMENTOS',
    'PANES',
  ];

  final Map<String, int> _points = <String, int>{
    'red': 0,
    'yellow': 0,
    'orange': 0,
    'green': 0,
    'purple': 0,
    'pink': 0,
    'gray': 0,
    'blue': 0,
  };

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(sessionProvider);
    final isLoggedIn = auth.isAuthenticated == true && auth.userId != null;

    debugPrintLevels(
        10, "PersonalFoodsScreen. Usuario con sesión: $isLoggedIn");

    return Scaffold(
      backgroundColor: appTheme.surface,
      appBar: AppBar(
        backgroundColor: appTheme.primary,
        foregroundColor: appTheme.onPrimary,
        title: Text(
          isLoggedIn ? 'Mis alimentos personales' : 'Alimentos personales',
          style: TextStyle(
            fontSize: fontSizeTituloPagina,
            fontWeight: FontWeight.bold,
            color: appTheme.onPrimary,
          ),
        ),
      ),
      body: isLoggedIn
          ? _PersonalFoodsList(
              userId: auth.userId!,
              onTapDelete: (item) => _confirmDelete(context, item),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Primero debes iniciar sesión para crear tus alimentos personales.',
                  style: TextStyle(color: appTheme.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
      floatingActionButton: isLoggedIn
          ? FloatingActionButton.extended(
              onPressed: _openAddModal,
              icon: const Icon(Icons.add),
              label: const Text('Agregar alimento'),
            )
          : null,
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, FoodCatalogItem item) async {
    final ok = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Eliminar alimento'),
            content: Text('¿Eliminar "${item.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                style: FilledButton.styleFrom(
                  backgroundColor: appTheme.error,
                ),
                child: const Text('Eliminar'),
              ),
            ],
          ),
        ) ??
        false;

    if (ok) {
      auth = ref.read(sessionProvider);
      final userId = auth.userId ?? '';
      final success = await ref
          .read(foodCatalogRepositoryProvider)
          .deletePersonalFood(id: item.id, userId: userId);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                success ? 'Alimento eliminado' : 'No fue posible eliminar')),
      );
    }
  }

  void _openAddModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _AddPersonalFoodForm(
        nameCtrl: _nameCtrl,
        portionCtrl: _portionCtrl,
        weightCtrl: _weightCtrl,
        categories: _allCategories,
        onDone: _onAddDone,
      ),
    );
  }

  void _onAddDone(String category, bool isFree, Map<String, int> points) async {
    _selectedCategory = category;
    _isFree = isFree;
    _points
      ..clear()
      ..addAll(points);
    setState(() {});
  }
}

class _PersonalFoodsList extends ConsumerWidget {
  final String userId;
  final void Function(FoodCatalogItem item) onTapDelete;

  const _PersonalFoodsList({
    required this.userId,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogAsync = ref.watch(foodCatalogProvider(userId));

    return catalogAsync.when(
      data: (catalog) {
        final personal = catalog
            .where((i) => i.type == 'personal' && i.userId == userId)
            .toList();

        final grouped = <String, List<FoodCatalogItem>>{};
        for (final item in personal) {
          grouped.putIfAbsent(item.category, () => []).add(item);
          grouped[item.category]!.sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        }

        if (personal.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Aún no has capturado alimentos personales. Toca el botón + para agregar.',
                style: TextStyle(color: appTheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: grouped.keys.length,
          itemBuilder: (context, idx) {
            final cat = grouped.keys.elementAt(idx);
            final items = grouped[cat]!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                  child: Text(
                    cat,
                    style: TextStyle(
                      fontSize: fontSizeSubtituloPagina + 1,
                      fontWeight: FontWeight.bold,
                      color: appTheme.primary,
                    ),
                  ),
                ),
                ...items.map(
                  (item) => Dismissible(
                    key: ValueKey<String>(item.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: appTheme.error,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (_) async {
                      final ok = await showDialog<bool>(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Eliminar alimento'),
                              content: Text('¿Eliminar "${item.name}"?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('Cancelar'),
                                ),
                                FilledButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: appTheme.error,
                                  ),
                                  child: const Text('Eliminar'),
                                ),
                              ],
                            ),
                          ) ??
                          false;
                      return ok;
                    },
                    onDismissed: (_) async {
                      final success = await ref
                          .read(foodCatalogRepositoryProvider)
                          .deletePersonalFood(id: item.id, userId: userId);
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(success
                                ? 'Alimento eliminado'
                                : 'No fue posible eliminar')),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '${item.portion}${item.weightOrVolume != null && item.weightOrVolume!.isNotEmpty ? ' • ${item.weightOrVolume}' : ''}${item.isFree ? ' • Libre' : ''}',
                      ),
                      trailing: Icon(Icons.delete_outline,
                          color: appTheme.onSurfaceVariant),
                      onTap: () => onTapDelete(item),
                    ),
                  ),
                ),
                if (idx < grouped.keys.length - 1) const Divider(),
              ],
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text('Error: $e'),
        ),
      ),
    );
  }
}

class _AddPersonalFoodForm extends ConsumerStatefulWidget {
  final TextEditingController nameCtrl;
  final TextEditingController portionCtrl;
  final TextEditingController weightCtrl;
  final List<String> categories;
  final void Function(String category, bool isFree, Map<String, int> points)
      onDone;

  const _AddPersonalFoodForm({
    required this.nameCtrl,
    required this.portionCtrl,
    required this.weightCtrl,
    required this.categories,
    required this.onDone,
  });

  @override
  ConsumerState<_AddPersonalFoodForm> createState() =>
      _AddPersonalFoodFormState();
}

class _AddPersonalFoodFormState extends ConsumerState<_AddPersonalFoodForm> {
  String _category;
  bool _isFree;
  final Map<String, int> _points;

  _AddPersonalFoodFormState()
      : _category = 'Otros',
        _isFree = false,
        _points = {
          'red': 0,
          'yellow': 0,
          'orange': 0,
          'green': 0,
          'purple': 0,
          'pink': 0,
          'gray': 0,
          'blue': 0,
        };

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(sessionProvider);
    final userId = auth.userId ?? '';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isFree ? 'Nuevo alimento libre' : 'Nuevo alimento',
              style: TextStyle(
                fontSize: fontSizeTituloPagina,
                fontWeight: FontWeight.bold,
                color: appTheme.primary,
              ),
            ),
            const SizedBox(height: 12),

            // Nombre
            TextField(
              controller: widget.nameCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nombre del alimento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Porción
            TextField(
              controller: widget.portionCtrl,
              decoration: const InputDecoration(
                labelText: 'Porción de referencia',
                border: OutlineInputBorder(),
                hintText: 'ej. 1 taza, 1 pieza',
              ),
            ),
            const SizedBox(height: 12),

            // Peso/Volumen
            TextField(
              controller: widget.weightCtrl,
              decoration: const InputDecoration(
                labelText: 'Peso/volumen (opcional)',
                border: OutlineInputBorder(),
                hintText: 'ej. 150 g, 250 ml',
              ),
            ),
            const SizedBox(height: 12),

            // Categoría
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(
                labelText: 'Grupo / Categoría',
                border: OutlineInputBorder(),
              ),
              items: widget.categories
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (v) {
                if (v == null) return;
                setState(() => _category = v);
                widget.onDone(_category, _isFree, _points);
              },
            ),
            const SizedBox(height: 12),

            // Libre / No libre
            SwitchListTile(
              title: const Text('Alimento libre'),
              subtitle: const Text('No suma puntos de colores'),
              value: _isFree,
              contentPadding: EdgeInsets.zero,
              onChanged: (v) {
                setState(() => _isFree = v);
                widget.onDone(_category, _isFree, _points);
              },
            ),

            if (!_isFree) ...[
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Puntos por color'),
              ),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _points.keys.map((color) {
                    final c = _colorFor(color);
                    return SizedBox(
                      width: 96,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: _colorLabel(color),
                            prefixIcon: Icon(Icons.circle, color: c, size: 16),
                            border: const OutlineInputBorder(),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (v) {
                            final n = int.tryParse(v) ?? 0;
                            _points[color] = n;
                            widget.onDone(_category, _isFree, _points);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 12),

            FilledButton.icon(
              onPressed: () async {
                final name = widget.nameCtrl.text.trim();
                final portion = widget.portionCtrl.text.trim();
                final weight = widget.weightCtrl.text.trim();

                if (name.isEmpty || portion.isEmpty || userId.isEmpty) {
                  return;
                }

                final repo = ref.read(foodCatalogRepositoryProvider);
                final item = await repo.createPersonalFood(
                  userId: userId,
                  name: name,
                  category: _category,
                  portion: portion,
                  isFree: _isFree,
                  colorPoints: _points,
                  weightOrVolume: weight,
                );

                if (!mounted) return;
                if (item == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('No fue posible guardar el alimento.')),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('"${item.name}" guardado')),
                );
                if (context.mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Color _colorFor(String key) {
    switch (key) {
      case 'red':
        return Colors.red;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'gray':
      default:
        return Colors.grey;
    }
  }

  String _colorLabel(String key) {
    switch (key) {
      case 'red':
        return 'Rojo';
      case 'yellow':
        return 'Amarillo';
      case 'orange':
        return 'Naranja';
      case 'green':
        return 'Verde';
      case 'blue':
        return 'Azul';
      case 'purple':
        return 'Morado';
      case 'pink':
        return 'Rosa';
      case 'gray':
      default:
        return 'Gris';
    }
  }
}
