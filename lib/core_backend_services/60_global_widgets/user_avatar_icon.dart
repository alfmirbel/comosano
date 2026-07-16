import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../07_routes/app_routes.dart';
import '../10_user_login/usuario_login/provider_session.dart';
import '../20_var_globales/var_color_themes.dart';

class UserAvatarIcon extends ConsumerWidget {
  const UserAvatarIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(sessionProvider);
    final isAuthenticated = authState.isAuthenticated;
    final userName = authState.userName ?? authState.sessionUserData.userName;

    String avatarBase64 = "";
    if (isAuthenticated && authState.sessionUserData.avatarBase64 != null && authState.sessionUserData.avatarBase64!.isNotEmpty) {
      avatarBase64 = authState.sessionUserData.avatarBase64!;
    }
    final hasAvatar = avatarBase64.isNotEmpty;

    Widget icon;
    if (hasAvatar) {
      icon = CircleAvatar(
        radius: 16,
        backgroundImage: MemoryImage(base64Decode(avatarBase64)),
      );
    } else if (isAuthenticated) {
      icon = Icon(Icons.person, color: appTheme.primary);
    } else {
      icon = Icon(Icons.person_off, color: appTheme.primary);
    }

    return IconButton(
      icon: icon,
      tooltip: isAuthenticated ? userName : "Sin usuario",
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.login);
      },
    );
  }
}
