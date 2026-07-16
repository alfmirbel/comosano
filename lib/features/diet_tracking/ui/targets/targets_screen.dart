import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/target_points_notifier.dart';
import 'package:comosano/core_backend_services/20_var_globales/variables_globales.dart';

class TargetsScreen extends ConsumerStatefulWidget {
  const TargetsScreen({super.key});

  @override
  ConsumerState<TargetsScreen> createState() => _TargetsScreenState();
}

class _TargetsScreenState extends ConsumerState<TargetsScreen> {
  // Colores iniciales y sus nombres de categoría
  final Map<String, String> categoryNames = {
    "red": "Proteínas",
    "orange": "Carbohidratos",
    "green": "Verduras",
    "blue": "Lácteos",
    "yellow": "Grasas y sustitutos",
    "purple": "Frutas",
    "pink": "Azúcares",
    "gray": "Platillos",
  };

  final List<String> availableColors = [
    "red",
    "orange",
    "green",
    "blue",
    "yellow",
    "purple",
    "pink",
    "gray",
  ];

  @override
  Widget build(BuildContext context) {
    final targetPoints = ref.watch(targetPointsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Metas por Categoría")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: availableColors.length - 1,
        itemBuilder: (context, index) {
          final colorKey = availableColors[index];
          final currentValue = targetPoints.slotsPerCategory[colorKey] ?? 0;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: _getColorFromString(colorKey),
                        radius: 12,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${colorKey.toUpperCase()} - ${categoryNames[colorKey]}",
                        style: TextStyle(
                          fontSize: fontSizeTituloPagina,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "$currentValue pts",
                        style: TextStyle(
                          fontSize: fontSizeTituloPagina,
                          fontWeight: FontWeight.w600,
                          color: _getColorFromString(colorKey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: _getColorFromString(colorKey),
                      inactiveTrackColor: _getColorFromString(
                        colorKey,
                      ).withValues(alpha: 0.2),
                      thumbColor: _getColorFromString(colorKey),
                      overlayColor: _getColorFromString(
                        colorKey,
                      ).withValues(alpha: 0.1),
                    ),
                    child: Slider(
                      value: currentValue.toDouble(),
                      min: 0,
                      max:
                          20, // Suponiendo un máximo de 20 puntos por categoría
                      divisions: 20,
                      label: currentValue.toString(),
                      onChanged: (double value) {
                        ref
                            .read(targetPointsProvider.notifier)
                            .setSlotsForCategory(colorKey, value.toInt());
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context); // Guardar y regresar
        },
        icon: const Icon(Icons.save),
        label: const Text("Guardar Metas"),
      ),
    );
  }

  Color _getColorFromString(String colorString) {
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
}
