class RegisterModel {
  final String username;
  final String password;
  final String fullname;
  final String email;

  RegisterModel({
    required this.username,
    required this.password,
    required this.fullname,
    required this.email,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      username: json['username'],
      password: json['password'],
      fullname: json['fullname'],
      email: json['email'],
    );
  }
}