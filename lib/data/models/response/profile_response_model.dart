import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) =>
    ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) =>
    json.encode(data.toJson());

class ProfileResponseModel {
  final String nickname;
  final String fullname;
  final String email;
  final String image;

  ProfileResponseModel({
    required this.nickname,
    required this.fullname,
    required this.email,
    required this.image,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        nickname: json["nickname"] ?? '',
        fullname: json["fullname"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "fullname": fullname,
        "email": email,
        "image": image,
      };
}
