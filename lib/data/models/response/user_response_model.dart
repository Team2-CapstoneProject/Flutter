import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
    final String message;
    final ProfileWithoutPassword profileWithoutPassword;

    ProfileResponseModel({
        required this.message,
        required this.profileWithoutPassword,
    });

    factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
        message: json["message"],
        profileWithoutPassword: ProfileWithoutPassword.fromJson(json["profileWithoutPassword"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "profileWithoutPassword": profileWithoutPassword.toJson(),
    };
}

class ProfileWithoutPassword {
    final int id;
    final dynamic googleId;
    final String image;
    final String email;
    final String fullname;
    final String nickname;
    final String phoneNumber;
    final DateTime createdAt;
    final DateTime updatedAt;

    ProfileWithoutPassword({
        required this.id,
        required this.googleId,
        required this.image,
        required this.email,
        required this.fullname,
        required this.nickname,
        required this.phoneNumber,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ProfileWithoutPassword.fromJson(Map<String, dynamic> json) => ProfileWithoutPassword(
        id: json["id"],
        googleId: json["google_id"],
        image: json["image"],
        email: json["email"],
        fullname: json["fullname"],
        nickname: json["nickname"],
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "google_id": googleId,
        "image": image,
        "email": email,
        "fullname": fullname,
        "nickname": nickname,
        "phone_number": phoneNumber,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
