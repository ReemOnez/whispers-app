class AuthUser {
  final String id;
  final String nickname;
  final String? profileImageUrl;

  const AuthUser({
    required this.id,
    required this.nickname,
    this.profileImageUrl,
  });

  factory AuthUser.fromMap(Map<String, dynamic> map, String id) {
    return AuthUser(
      id: id,
      nickname: map['nickname'] ?? '',
      profileImageUrl: map['profileImageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'profileImageUrl': profileImageUrl,
    };
  }
}
