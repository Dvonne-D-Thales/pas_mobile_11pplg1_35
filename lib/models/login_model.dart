class LoginModel {
  final String username;
  final String password;
  final String email;
  final String token;

  LoginModel({
    required this.username,
    required this.password,
    required this.email,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
    );
  }
}