// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TargetPoints _$TargetPointsFromJson(Map<String, dynamic> json) =>
    _TargetPoints(
      slotsPerCategory:
          (json['slotsPerCategory'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              const <String, int>{},
    );

Map<String, dynamic> _$TargetPointsToJson(_TargetPoints instance) =>
    <String, dynamic>{
      'slotsPerCategory': instance.slotsPerCategory,
    };

_FoodEntry _$FoodEntryFromJson(Map<String, dynamic> json) => _FoodEntry(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      colorPoints: Map<String, int>.from(json['colorPoints'] as Map),
      isFree: json['isFree'] as bool? ?? false,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$FoodEntryToJson(_FoodEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'colorPoints': instance.colorPoints,
      'isFree': instance.isFree,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_DailyLog _$DailyLogFromJson(Map<String, dynamic> json) => _DailyLog(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      targetPoints:
          TargetPoints.fromJson(json['targetPoints'] as Map<String, dynamic>),
      consumedFoods: (json['consumedFoods'] as List<dynamic>?)
              ?.map((e) => FoodEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DailyLogToJson(_DailyLog instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'targetPoints': instance.targetPoints,
      'consumedFoods': instance.consumedFoods,
    };

_FoodCatalogItem _$FoodCatalogItemFromJson(Map<String, dynamic> json) =>
    _FoodCatalogItem(
      id: json['_id'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      portion: json['portion'] as String,
      isFree: json['isFree'] as bool? ?? false,
      colorPoints: (json['colorPoints'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const <String, int>{},
      type: json['type'] as String? ?? 'general',
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      weightOrVolume: json['weightOrVolume'] as String?,
    );

Map<String, dynamic> _$FoodCatalogItemToJson(_FoodCatalogItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'portion': instance.portion,
      'isFree': instance.isFree,
      'colorPoints': instance.colorPoints,
      'type': instance.type,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'weightOrVolume': instance.weightOrVolume,
    };
