import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../40_security/direccionip.dart';
import '../../60_global_widgets/debugprint.dart';
import '../data_models/auth_state.dart';
import '../usuario_login/data_session.dart';

class SessionRepository {
  Future<(int, Map<String, dynamic>?)> getUserDataByName({
    required String userName,
    required Map<String, String> authHeaders,
  }) async {
    debugPrintLevels(0, "HTTP getUserDataByName");
    try {
      final encodedKey = Uri.encodeComponent('"$userName"');
      final url =
          '$direccionip/comosano_usuarios/_design/DDUSER/_view/vistaNOMBRE?key=$encodedKey';
      final response = await http.get(Uri.parse(url), headers: authHeaders);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        return (200, data);
      }
      return (response.statusCode, null);
    } catch (e) {
      debugPrintLevels(0, ">> Exception: $e");
      return (500, null);
    }
  }

  Future<(int, Map<String, dynamic>?)> getUserIdNamePassByName({
    required String userName,
    required Map<String, String> authHeaders,
  }) async {
    debugPrintLevels(0, "HTTP getUserIdNamePassByName");
    try {
      final url =
          '$direccionip/comosano_usuarios/_design/DDUSER/_view/vistaIdUserPassByNAME?key="$userName"';
      final response = await http.get(Uri.parse(url), headers: authHeaders);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        return (200, data);
      }
      return (response.statusCode, null);
    } catch (e) {
      debugPrintLevels(0, "Error: $e");
      return (500, null);
    }
  }

  Future<http.Response> createUser({
    required Map<String, String> authHeaders,
    required Map<String, dynamic> body,
  }) async {
    debugPrintLevels(0, "HTTP createUser");
    final url = '$direccionip/comosano_usuarios';
    return await http.post(
      Uri.parse(url),
      headers: authHeaders,
      body: json.encode(body),
    );
  }
}

final sessionRepositoryProvider = Provider((_) => SessionRepository());
