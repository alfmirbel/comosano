import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core_backend_services/40_security/direccionip.dart';
import '../../../../core_backend_services/60_global_widgets/debugprint.dart';
import '../models/models.dart';

part 'food_catalog_repository.g.dart';

class FoodCatalogRepository {
  // Reutiliza auth básico existente en el proyecto.
  Map<String, String> get _authHeaders {
    final basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    return {'Authorization': basicAuth, 'Content-Type': 'application/json'};
  }

  static const _dbBase = '$direccionip/comosano_alimentos';
  static const _localPrefixed = 'local_food_catalog';

  Future<List<FoodCatalogItem>> _getGeneralFromAsset() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/dieta_alimentos_consolidado.json',
    );
    final list = json.decode(jsonString) as List<dynamic>;

    return list
        .map((e) {
          final raw = e as Map<String, dynamic>;
          return FoodCatalogItem(
            id: raw['_id'] as String,
            category: raw['category'] as String,
            name: raw['name'] as String,
            portion: raw['portion'] as String,
            isFree: raw['isFree'] as bool? ?? false,
            colorPoints: ((raw['colorPoints'] as Map?)?.map(
                  (k, v) => MapEntry(k.toString(), (v as num).toInt()),
                ) ??
                const <String, int>{}) as Map<String, int>,
            type: 'general',
            weightOrVolume: (raw['weightOrVolume'] as String?) ?? '',
          );
        })
        .toList(growable: false);
  }

  // Recorre el asset JSON y hace put() por cada ítem, manejando _rev cuando existe.
  Future<void> seedGeneralCatalog() async {
    final items = await _getGeneralFromAsset();
    for (final item in items) {
      final url = '$_dbBase/${item.id}';
      try {
        String? rev;
        try {
          final head = await http.head(Uri.parse(url), headers: _authHeaders);
          if (head.statusCode == 200) {
            rev = head.headers['etag']?.replaceAll('"', '');
          }
        } catch (_) {}

        final body = <String, dynamic>{
          'id': item.id,
          if (rev != null) '_rev': rev,
          'type': 'general',
          'category': item.category,
          'name': item.name,
          'portion': item.portion,
          'isFree': item.isFree,
          'colorPoints': item.colorPoints,
          'weightOrVolume': item.weightOrVolume,
        };

        final response = await http.put(
          Uri.parse(url),
          headers: _authHeaders,
          body: json.encode(body),
        );

        if (!(response.statusCode == 200 || response.statusCode == 201)) {
          debugPrintLevels(
            1,
            'FoodCatalog seed failed for ${item.id}: ${response.statusCode} ${response.body}',
          );
        }
      } catch (e) {
        debugPrintLevels(1, 'Exception during seed: $e');
      }
    }
  }

  Future<List<FoodCatalogItem>> getCatalog({
    required String? userId,
    bool forceRemote = false,
  }) async {
    if (userId == null || userId.isEmpty) {
      return _getGeneralFromAsset();
    }

    final general = await _getGeneralFromAsset();
    final personal = await _fetchPersonalForUser(userId);
    return [...general, ...personal];
  }

  Future<List<FoodCatalogItem>> _fetchPersonalForUser(String userId) async {
    try {
      // Intento por vista si el backend la expone.
      final url = '$_dbBase/_design/food/_list/byUser/user_personal_by_user?key=${Uri.encodeQueryComponent(userId)}';
      final response = await http.get(Uri.parse(url), headers: _authHeaders);

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        if (data is List) {
          final items = data
              .map((e) => _remoteRowToItem(e as Map<String, dynamic>))
              .toList(growable: false);
          await _writePersonalCache(userId, items);
          return items;
        }
      }
    } catch (e) {
      debugPrintLevels(1, 'Exception fetch personal remote: $e');
    }

    final cached = await _readPersonalCache(userId);
    if (cached != null) return cached;
    return const <FoodCatalogItem>[];
  }

  Future<void> _writePersonalCache(String userId, List<FoodCatalogItem> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('$_localPrefixed:$userId', json.encode(items.map((i) => i.toJson()).toList()));
    } catch (_) {}
  }

  Future<List<FoodCatalogItem>?> _readPersonalCache(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final str = prefs.getString('$_localPrefixed:$userId');
      if (str == null) return null;
      final list = json.decode(str) as List<dynamic>;
      return list
          .map((e) => FoodCatalogItem.fromJson(e as Map<String, dynamic>))
          .toList(growable: false);
    } catch (_) {
      return null;
    }
  }

  FoodCatalogItem _remoteRowToItem(Map<String, dynamic> json) {
    return FoodCatalogItem(
      id: json['_id'] as String? ?? json['id'] as String,
      category: json['category'] as String? ?? '',
      name: json['name'] as String? ?? '',
      portion: json['portion'] as String? ?? '',
      isFree: json['isFree'] as bool? ?? false,
      colorPoints: ((json['colorPoints'] as Map?)?.map(
            (k, v) => MapEntry(k.toString(), (v as num).toInt()),
          ) ??
          const <String, int>{}) as Map<String, int>,
      type: json['type'] as String? ?? 'personal',
      userId: json['userId'] as String?,
      weightOrVolume: (json['weightOrVolume'] as String?) ?? '',
    );
  }

  Future<FoodCatalogItem?> createPersonalFood({
    required String userId,
    required String name,
    required String category,
    required String portion,
    bool isFree = false,
    Map<String, int>? colorPoints,
    String? weightOrVolume,
  }) async {
    final now = DateTime.now();
    final slug = name.trim().toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '_');
    final id = 'pf_${userId}_${now.millisecondsSinceEpoch}_$slug';
    final item = FoodCatalogItem(
      id: id,
      category: category,
      name: name,
      portion: portion,
      isFree: isFree,
      colorPoints: colorPoints ?? const <String, int>{},
      type: 'personal',
      userId: userId,
      createdAt: now,
      updatedAt: now,
      weightOrVolume: weightOrVolume ?? '',
    );

    final url = '$_dbBase/$id';
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: _authHeaders,
        body: json.encode(<String, dynamic>{
          '_id': id,
          'type': 'personal',
          'userId': userId,
          'category': category,
          'name': name,
          'portion': portion,
          'isFree': isFree,
          'colorPoints': item.colorPoints,
          'weightOrVolume': item.weightOrVolume,
          'createdAt': now.toIso8601String(),
          'updatedAt': now.toIso8601String(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return item;
      }

      debugPrintLevels(
        1,
        'createPersonalFood failed: ${response.statusCode} ${response.body}',
      );
    } catch (e) {
      debugPrintLevels(1, 'Exception createPersonalFood: $e');
    }

    return null;
  }

  Future<bool> deletePersonalFood({required String id, required String userId}) async {
    final url = '$_dbBase/$id';
    try {
      String? rev;
      try {
        final head = await http.head(Uri.parse(url), headers: _authHeaders);
        if (head.statusCode == 200) {
          rev = head.headers['etag']?.replaceAll('"', '');
        }
      } catch (_) {}

      final response = await http.delete(
        Uri.parse(url),
        headers: _authHeaders,
        body: json.encode(rev != null ? {'_rev': rev} : <String, dynamic>{}),
      );

      if (response.statusCode == 200 || response.statusCode == 404) {
        return true;
      }

      debugPrintLevels(
        1,
        'deletePersonalFood failed: ${response.statusCode} ${response.body}',
      );
    } catch (e) {
      debugPrintLevels(1, 'Exception deletePersonalFood: $e');
    }

    return false;
  }
}

@riverpod
FoodCatalogRepository foodCatalogRepository(Ref ref) {
  return FoodCatalogRepository();
}
