class SignupRequestBody {
  final String name;
  final String email;
  final String password;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) {
    return SignupRequestBody(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}
