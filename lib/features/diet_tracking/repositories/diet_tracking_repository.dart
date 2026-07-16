import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core_backend_services/40_security/direccionip.dart';
import '../../../../core_backend_services/60_global_widgets/debugprint.dart';
import '../models/models.dart';

part 'diet_tracking_repository.g.dart';

class DietTrackingRepository {
  Map<String, String> get _authHeaders {
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    return {'Authorization': basicAuth, 'Content-Type': 'application/json'};
  }

  // --- Target Points ---
  Future<TargetPoints?> fetchTargetPoints(String userId) async {
    if (userId.isEmpty) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final str = prefs.getString('local_target_points');
        if (str != null) {
          return TargetPoints.fromJson(json.decode(str));
        }
      } catch (e) {
        debugPrintLevels(1, "Exception fetching local TargetPoints: $e");
      }
      return null;
    }

    final url = '$direccionip/comosano_perfil_nutricional/$userId';
    try {
      final response = await http.get(Uri.parse(url), headers: _authHeaders);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        final targets = TargetPoints.fromJson(data['targetPoints'] as Map<String, dynamic>);
        
        // Sincronizar copia local
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('local_target_points', json.encode(targets.toJson()));
        
        return targets;
      } else if (response.statusCode == 404) {
        return null; // Not set yet
      }
    } catch (e) {
      debugPrintLevels(1, "Exception fetching TargetPoints: $e");
    }
    return null;
  }

  Future<bool> saveTargetPoints(TargetPoints targets, String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('local_target_points', json.encode(targets.toJson()));
    } catch (e) {
      debugPrintLevels(1, "Exception saving local TargetPoints: $e");
    }

    if (userId.isEmpty) return true;

    final url = '$direccionip/comosano_perfil_nutricional/$userId';
    try {
      // Intentar obtener el rev actual si existe
      String? rev;
      final checkResponse = await http.head(Uri.parse(url), headers: _authHeaders);
      if (checkResponse.statusCode == 200) {
        rev = checkResponse.headers['etag']?.replaceAll('"', '');
      }

      final body = {
        if (rev != null) '_rev': rev,
        'userId': userId,
        'targetPoints': targets.toJson(),
        'type': 'TargetPoints',
      };

      final response = await http.put(
        Uri.parse(url),
        headers: _authHeaders,
        body: json.encode(body),
      );

      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      debugPrintLevels(1, "Exception saving TargetPoints: $e");
      return false;
    }
  }

  // --- Daily Log ---
  Future<DailyLog?> fetchDailyLog(DateTime date, String userId) async {
    final dateStr = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    
    if (userId.isEmpty) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final str = prefs.getString('local_log_$dateStr');
        if (str != null) {
          return DailyLog.fromJson(json.decode(str));
        }
      } catch (e) {
        debugPrintLevels(1, "Exception fetching local DailyLog: $e");
      }
      return null;
    }

    final docId = 'log:$userId:$dateStr';
    final url = '$direccionip/comosano_log_calorias/$docId';

    try {
      final response = await http.get(Uri.parse(url), headers: _authHeaders);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        final log = DailyLog.fromJson(data['dailyLog'] as Map<String, dynamic>);
        
        // Sincronizar copia local
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('local_log_$dateStr', json.encode(log.toJson()));
        
        return log;
      } else if (response.statusCode == 404) {
        return null; // Not found for today
      }
    } catch (e) {
      debugPrintLevels(1, "Exception fetching DailyLog: $e");
    }
    return null;
  }

  Future<bool> saveDailyLog(DailyLog log, String userId) async {
    final dateStr = "${log.date.year}-${log.date.month.toString().padLeft(2, '0')}-${log.date.day.toString().padLeft(2, '0')}";
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('local_log_$dateStr', json.encode(log.toJson()));
    } catch (e) {
      debugPrintLevels(1, "Exception saving local DailyLog: $e");
    }

    if (userId.isEmpty) return true;

    final docId = 'log:$userId:$dateStr';
    final url = '$direccionip/comosano_log_calorias/$docId';

    try {
      // Intentar obtener el rev actual si existe
      String? rev;
      final checkResponse = await http.head(Uri.parse(url), headers: _authHeaders);
      if (checkResponse.statusCode == 200) {
        rev = checkResponse.headers['etag']?.replaceAll('"', '');
      }

      final body = {
        if (rev != null) '_rev': rev,
        'userId': userId,
        'dateString': dateStr,
        'dailyLog': log.toJson(),
        'type': 'DailyLog',
      };

      final response = await http.put(
        Uri.parse(url),
        headers: _authHeaders,
        body: json.encode(body),
      );

      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      debugPrintLevels(1, "Exception saving DailyLog: $e");
      return false;
    }
  }
}

@riverpod
DietTrackingRepository dietTrackingRepository(Ref ref) {
  return DietTrackingRepository();
}
