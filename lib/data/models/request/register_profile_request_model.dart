import 'dart:convert';
import 'dart:io';

class RegisterProfileRequestModel {
  String? fullname;
  String? nickname;
  File? image;
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
      'image': image?.path ?? '',
      'phone_number': phone_number,
    };
  }

  factory RegisterProfileRequestModel.fromMap(Map<String, dynamic> map) {
    String imagePath = (map['image'] != null && map['image'] != '')
        ? map['image']
        : 'assets/default.png';

    return RegisterProfileRequestModel(
      fullname: map['fullname'],
      nickname: map['nickname'],
      image: File(imagePath),
      phone_number: map['phone_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterProfileRequestModel.fromJson(String source) =>
      RegisterProfileRequestModel.fromMap(json.decode(source));
}
