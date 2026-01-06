class AuthError implements Exception {
  final String message;

  AuthError({required this.message});

  @override
  String toString() => message;
}