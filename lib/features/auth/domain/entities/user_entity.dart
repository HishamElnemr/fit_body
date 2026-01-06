class UserEntity {
  final String name;
  final String email;
  final String token;

  UserEntity({required this.name, required this.email, required this.token});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}