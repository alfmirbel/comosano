class SessionData {
  final String key;
  final String varName;
  final String valueToSave;
  final String userId;
  final String userName;
  final String userPass;
  final String? avatarBase64;

  const SessionData({
    this.key = '',
    this.varName = '',
    this.valueToSave = '',
    this.userId = '',
    this.userName = '',
    this.userPass = '',
    this.avatarBase64,
  });

  SessionData copyWith({
    String? key,
    String? varName,
    String? valueToSave,
    String? userId,
    String? userName,
    String? userPass,
    String? avatarBase64,
  }) {
    return SessionData(
      key: key ?? this.key,
      varName: varName ?? this.varName,
      valueToSave: valueToSave ?? this.valueToSave,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPass: userPass ?? this.userPass,
      avatarBase64: avatarBase64 ?? this.avatarBase64,
    );
  }
}
