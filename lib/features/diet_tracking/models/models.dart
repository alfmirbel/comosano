import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class TargetPoints with _$TargetPoints {
  const TargetPoints._();
  const factory TargetPoints({
    @Default(<String, int>{}) Map<String, int> slotsPerCategory,
  }) = _TargetPoints;

  factory TargetPoints.fromJson(Map<String, dynamic> json) =>
      _$TargetPointsFromJson(json);
}

@freezed
abstract class FoodEntry with _$FoodEntry {
  const FoodEntry._();
  const factory FoodEntry({
    required String id,
    required String name,
    required String category,
    required Map<String, int> colorPoints,
    @Default(false) bool isFree,
    required DateTime timestamp,
  }) = _FoodEntry;

  factory FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryFromJson(json);
}

@freezed
abstract class DailyLog with _$DailyLog {
  const DailyLog._();

  const factory DailyLog({
    required String id, // Por lo general, se usa "YYYY-MM-DD"
    required DateTime date,
    required TargetPoints targetPoints,
    @Default([]) List<FoodEntry> consumedFoods,
  }) = _DailyLog;

  factory DailyLog.fromJson(Map<String, dynamic> json) =>
      _$DailyLogFromJson(json);

  // Calcula los puntos totales consumidos por cada color (excluyendo "Libre")
  Map<String, int> get consumedColorPoints {
    final map = <String, int>{};
    for (var food in consumedFoods) {
      if (food.isFree) continue;
      food.colorPoints.forEach((color, points) {
        map[color] = (map[color] ?? 0) + points;
      });
    }
    return map;
  }

  // Retorna el porcentaje total (0 a 100+). 
  // Cada categoría vale su proporción. 
  double get totalPercentage {
    if (targetPoints.slotsPerCategory.isEmpty) return 0.0;

    final consumed = consumedColorPoints;
    double totalPercent = 0.0;
    int validCategoriesCount = 0;

    targetPoints.slotsPerCategory.forEach((color, target) {
      if (target > 0) {
        validCategoriesCount++;
        int cons = consumed[color] ?? 0;
        totalPercent += (cons / target);
      }
    });

    if (validCategoriesCount <= 0) return 0.0;
    return (totalPercent / validCategoriesCount) * 100;
  }
}

// Modelo para mapear el JSON del catálogo
@freezed
abstract class FoodCatalogItem with _$FoodCatalogItem {
  const FoodCatalogItem._();
  const factory FoodCatalogItem({
    @JsonKey(name: '_id') required String id,
    required String category,
    required String name,
    required String portion,
    @Default(false) bool isFree,
    @Default(<String, int>{}) Map<String, int> colorPoints,
    @Default('general') String type,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? weightOrVolume,
  }) = _FoodCatalogItem;

  factory FoodCatalogItem.fromJson(Map<String, dynamic> json) =>
      _$FoodCatalogItemFromJson(json);
}
