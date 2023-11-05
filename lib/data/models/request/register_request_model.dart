import 'dart:convert';

class RegisterRequestModel {
  String? google_id;
  String? image;
  String? email;
  String? fullname;
  String? nickname;
  String? password;
  int? phoneNumber;
  RegisterRequestModel({
    this.google_id,
    this.image,
    this.email,
    this.fullname,
    this.nickname,
    this.password,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'google_id': google_id,
      'image': image,
      'email': email,
      'fullname': fullname,
      'nickname': nickname,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      google_id: map['google_id'],
      image: map['image'],
      email: map['email'],
      fullname: map['fullname'],
      nickname: map['nickname'],
      password: map['password'],
      phoneNumber: map['phoneNumber']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));
}
