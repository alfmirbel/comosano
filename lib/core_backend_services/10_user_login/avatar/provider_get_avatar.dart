import 'package:flutter_riverpod/flutter_riverpod.dart';

final classUserAvatarProvider = Provider((_) => _AvatarStub());

class _AvatarStub {
  Future<void> recuperaDatosDelAvatar(String _userId) async {}
}
