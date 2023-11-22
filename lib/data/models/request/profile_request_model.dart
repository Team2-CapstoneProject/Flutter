import 'dart:convert';
import 'dart:io';

class ProfileRequestModel {
  String? fullname;
  String? nickname;
  File? image;
  String? phone_number;
  ProfileRequestModel({
    this.fullname,
    this.nickname,
    this.image,
    this.phone_number,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname ?? '',
      'nickname': nickname ?? '',
      'image': image!.path,
      'phone_number': phone_number ?? '',
    };
  }

  factory ProfileRequestModel.fromMap(Map<String, dynamic> map) {
    return ProfileRequestModel(
      fullname: map['fullname'],
      nickname: map['nickname'],
      image: File(map['image']),
      phone_number: map['phone_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileRequestModel.fromJson(String source) =>
      ProfileRequestModel.fromMap(json.decode(source));
}
