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
        image: json["image"] ??
            'https://images.unsplash.com/photo-1582266255765-fa5cf1a1d501?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "fullname": fullname,
        "email": email,
        "image": image,
      };
}
