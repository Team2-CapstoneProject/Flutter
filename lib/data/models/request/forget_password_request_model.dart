import 'dart:convert';

class ForgetPasswordRequestModel {
  final String email;
  final String newpassword;
  ForgetPasswordRequestModel({
    required this.email,
    required this.newpassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'newpassword': newpassword,
    };
  }

  factory ForgetPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ForgetPasswordRequestModel(
      email: map['email'] ?? '',
      newpassword: map['newpassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgetPasswordRequestModel.fromJson(String source) =>
      ForgetPasswordRequestModel.fromMap(json.decode(source));
}
