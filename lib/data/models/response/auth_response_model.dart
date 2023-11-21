import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  final String? message;
  final String token;
  final String email;
  final String fullname;
  final String image;
  final String nickname;
  final String phoneNumber;

  AuthResponseModel({
    this.message,
    required this.token,
    required this.email,
    required this.fullname,
    required this.image,
    required this.nickname,
    required this.phoneNumber,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"] ?? "",
        token: json["token"] ?? "",
        email: json["email"] ?? "",
        fullname: json["fullname"] ?? "",
        image: json["image"] ?? "",
        nickname: json["nickname"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "email": email,
        "fullname": fullname,
        "image": image,
        "nickname": nickname,
        "phone_number": phoneNumber,
      };
}
