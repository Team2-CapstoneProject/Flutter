import 'dart:convert';

class RegisterProfileRequestModel {
  String? fullname;
  String? nickname;
  String? image;
  String? phone_number;
  RegisterProfileRequestModel({
    this.fullname,
    this.nickname,
    this.image,
    this.phone_number,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'nickname': nickname,
      'image': image,
      'phone_number': phone_number,
    };
  }

  factory RegisterProfileRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterProfileRequestModel(
      fullname: map['fullname'],
      nickname: map['nickname'],
      image: map['image'],
      phone_number: map['phone_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterProfileRequestModel.fromJson(String source) =>
      RegisterProfileRequestModel.fromMap(json.decode(source));
}