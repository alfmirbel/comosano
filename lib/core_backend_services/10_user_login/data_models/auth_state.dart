import 'package:flutter/foundation.dart';

import '../usuario_login/data_session.dart';

@immutable
class AuthState {
  final SessionData sessionUserData;
  final bool isAuthenticated;
  final bool isUserDataLoaded;
  final String? userId;
  final String? userName;
  final String? userPass;
  final String? jwtToken;

  const AuthState({
    required this.sessionUserData,
    this.isAuthenticated = false,
    this.isUserDataLoaded = false,
    this.userId,
    this.userName,
    this.userPass,
    this.jwtToken,
  });

  factory AuthState.initial() => const AuthState(
    sessionUserData: SessionData(),
  );

  AuthState copyWith({
    SessionData? sessionUserData,
    bool? isAuthenticated,
    bool? isUserDataLoaded,
    String? userId,
    String? userName,
    String? userPass,
    String? jwtToken,
  }) {
    return AuthState(
      sessionUserData: sessionUserData ?? this.sessionUserData,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isUserDataLoaded: isUserDataLoaded ?? this.isUserDataLoaded,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPass: userPass ?? this.userPass,
      jwtToken: jwtToken ?? this.jwtToken,
    );
  }
}
