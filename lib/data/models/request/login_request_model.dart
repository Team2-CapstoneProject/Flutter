import 'dart:convert';

class LoginRequestModel {
  String email;
  String password;
  String loginType;

  LoginRequestModel({
    required this.email,
    required this.password,
    this.loginType = 'user',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'loginType': loginType,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      email: map['email'],
      password: map['password'],
      loginType: map['loginType'] ?? 'user',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source));
}
