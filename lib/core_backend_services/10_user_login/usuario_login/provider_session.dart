import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../40_security/direccionip.dart';
import '../../60_global_widgets/debugprint.dart';
import '../data_models/auth_state.dart';
import '../usuario_login/data_session.dart';
import 'session_repository.dart';

part 'provider_session.g.dart';

const _storage = FlutterSecureStorage();

@riverpod
class SessionNotifier extends _$SessionNotifier {
  Map<String, String> get _authHeaders {
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    return {'Authorization': basicAuth, 'Content-Type': 'application/json'};
  }

  @override
  AuthState build() {
    return AuthState.initial();
  }

  Future<void> getSessionValuesFromLocalStorage() async {
    debugPrintLevels(1, "STORAGE: Iniciando getSessionValuesFromLocalStorage()");
    final userId = await _storage.read(key: "userId") ?? "";
    final userName = await _storage.read(key: "userName") ?? "";
    final avatarBase64 = await _storage.read(key: "avatarBase64") ?? "";

    if (userId.isEmpty && userName.isEmpty) {
      debugPrintLevels(1, "STORAGE: No hay sesión guardada.");
      return;
    }

    state = state.copyWith(
      sessionUserData: SessionData(
        userId: userId,
        userName: userName,
        userPass: "",
        avatarBase64: avatarBase64.isEmpty ? null : avatarBase64,
      ),
      isAuthenticated: true,
    );

    debugPrintLevels(1, "STORAGE: Sesión marcada como autenticada.");
  }

  Future<void> saveVarValueToLocalStorage(String varName, String value) async {
    await _storage.write(key: varName, value: value);
  }

  Future<String?> getVarValueFromLocalStorage(String varName) async {
    return _storage.read(key: varName);
  }

  Future<bool> deleteLocalSessionData() async {
    await _storage.deleteAll();
    return true;
  }

  void setSessionVarValue(String varName, dynamic value) {
    final updated = state.sessionUserData.copyWith(
      userId: varName == "userId" ? "$value" : state.sessionUserData.userId,
      userName: varName == "userName" ? "$value" : state.sessionUserData.userName,
      userPass: varName == "userPass" ? "$value" : state.sessionUserData.userPass,
    );
    state = state.copyWith(sessionUserData: updated);
  }

  dynamic getSessionVarValue(String varName) {
    switch (varName) {
      case "userId":
        return state.sessionUserData.userId;
      case "userName":
        return state.sessionUserData.userName;
      case "userPass":
        return state.sessionUserData.userPass;
      default:
        return null;
    }
  }

  void resetInitialUserData(int seccion) {
    state = AuthState.initial();
  }

  Future<int> getUserDataByNameInSessionData() async {
    final repo = ref.read(sessionRepositoryProvider);
    final (statusCode, _) = await repo.getUserDataByName(
      userName: state.sessionUserData.userName,
      authHeaders: _authHeaders,
    );
    state = state.copyWith(isUserDataLoaded: statusCode == 200);
    return statusCode;
  }

  Future<int> getUserIdNamePassByName() async {
    final repo = ref.read(sessionRepositoryProvider);
    final (statusCode, data) = await repo.getUserIdNamePassByName(
      userName: state.sessionUserData.userName,
      authHeaders: _authHeaders,
    );

    if (statusCode == 200 && data is Map<String, dynamic>) {
      final rows = data['rows'];
      if (rows is List && rows.isNotEmpty) {
        final first = rows.first;
        final value = first is Map<String, dynamic> ? first['value'] : null;
        if (value is Map<String, dynamic>) {
          final userId = (value['userId'] ?? '').toString();
          final userName = (value['userName'] ?? '').toString();
          final userPass = (value['userPass'] ?? '').toString();

          state = state.copyWith(
            sessionUserData: SessionData(
              userId: userId,
              userName: userName,
              userPass: userPass,
            ),
            isAuthenticated: true,
          );
        }
      }
    }

    return statusCode;
  }

  void updateLocalidadEnSesion(Map<String, dynamic> _loc) {
    // No-op diet stub: geolocation update not implemented in diet tracking.
  }

  void setUserData(Map<String, dynamic> _usuarioSession) {
    // No-op diet stub: detailed profile payload not required here.
  }

  void setCampoUserData(String _campo, String _valor) {
    // No-op diet stub: migrated to typed fields in SessionData or domain repo.
  }

  String getCampoUserData(String _campo) {
    return "";
  }
}
