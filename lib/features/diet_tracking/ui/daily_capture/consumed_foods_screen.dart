import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/daily_log_notifier.dart';
import 'package:comosano/core_backend_services/20_var_globales/var_color_themes.dart';
import 'package:comosano/core_backend_services/20_var_globales/variables_globales.dart';

Color _colorFromString(String colorString) {
  switch (colorString.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'yellow':
      return Colors.yellow;
    case 'green':
      return Colors.green;
    case 'blue':
      return Colors.blue;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;
    default:
      return Colors.grey;
  }
}

class ConsumedFoodsScreen extends ConsumerStatefulWidget {
  final DateTime date;

  const ConsumedFoodsScreen({super.key, required this.date});

  @override
  ConsumerState<ConsumedFoodsScreen> createState() =>
      _ConsumedFoodsScreenState();
}

class _ConsumedFoodsScreenState extends ConsumerState<ConsumedFoodsScreen> {
  @override
  Widget build(BuildContext context) {
    final dailyLog = ref.watch(dailyLogProvider(widget.date));
    final consumed = dailyLog.consumedColorPoints;

    return Scaffold(
      backgroundColor: appTheme.surface,
      appBar: AppBar(
        backgroundColor: appTheme.primary,
        foregroundColor: appTheme.onPrimary,
        title: Text(
          "Alimentos Consumidos Hoy",
          style: TextStyle(
            fontSize: fontSizeTituloPagina,
            fontWeight: FontWeight.bold,
            color: appTheme.onPrimary,
          ),
        ),
      ),
      body: dailyLog.consumedFoods.isEmpty
          ? const Center(child: Text("Aún no has registrado alimentos hoy."))
          : Column(
              children: [
                // Category summary
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: consumed.entries.map((e) {
                      final color = _colorFromString(e.key);
                      final label = e.key[0].toUpperCase() + e.key.substring(1);
                      final target = dailyLog.targetPoints.slotsPerCategory[e.key] ?? 0;
                      final consumedPts = e.value;
                      final percentage = target > 0
                          ? ((consumedPts / target) * 100).clamp(0, 999).toStringAsFixed(0)
                          : "0";
                      return Chip(
                        avatar: CircleAvatar(
                          backgroundColor: color,
                          radius: 10,
                        ),
                        label: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  label,
                                  style: TextStyle(
                                    fontSize: fontSizeDialogCampo,
                                    color: appTheme.onSurface,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "$consumedPts/$target",
                                  style: TextStyle(
                                    color: appTheme.primary,
                                    fontSize: fontSizeDialogCampo + 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "$percentage%",
                              style: TextStyle(
                                fontSize: fontSizeTextoCarta,
                                color: appTheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: color.withValues(alpha: 0.1),
                        side: BorderSide(color: color.withValues(alpha: 0.3)),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      );
                    }).toList(),
                  ),
                ),
                const Divider(),
                // Food list
                Expanded(
                  child: ListView.builder(
                    itemCount: dailyLog.consumedFoods.length,
                    itemBuilder: (context, index) {
                      final food = dailyLog.consumedFoods[index];
                      return ListTile(
                        title: Text(food.name),
                        subtitle: Text(
                          DateFormat('HH:mm').format(food.timestamp),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (food.isFree)
                              Chip(
                                label: const Text(
                                  "Libre",
                                  style: TextStyle(fontSize: 10),
                                ),
                                backgroundColor: appTheme.tertiaryContainer,
                              )
                            else
                              ...food.colorPoints.entries.map(
                                (e) => _buildDot(e.key, e.value),
                              ),
                            IconButton(
                              icon: Icon(Icons.delete, color: appTheme.error),
                              onPressed: () {
                                ref
                                    .read(
                                      dailyLogProvider(widget.date).notifier,
                                    )
                                    .removeFoodEntry(food.id);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildDot(String colorString, int points) {
    final dotColor = _colorFromString(colorString);
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
