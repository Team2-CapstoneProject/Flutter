import 'dart:convert';

class RegisterRequestModel {
  final String? email;
  // final String? fullname;
  // final String? image;
  // final String? nickname;
  final String? password;
  // final String? phone_number;

  RegisterRequestModel({
    required this.email,
    // this.fullname,
    // this.image,
    // this.nickname,
    required this.password,
    // this.phone_number,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      // 'fullname': fullname,
      // 'image': image,
      // 'nickname': nickname,
      'password': password,
      // 'phone_number': phone_number,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      email: map['email'],
      // fullname: map['fullname'],
      // image: map['image'],
      // nickname: map['nickname'],
      password: map['password'],
      // phone_number: map['phone_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));
}
