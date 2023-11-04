import 'dart:convert';

class ProfileResponseModel {
  String? message;
  List<Profile>? profile;

  ProfileResponseModel({
    this.message,
    this.profile,
  });

  factory ProfileResponseModel.fromRawJson(String str) =>
      ProfileResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        message: json["message"],
        profile: json["profile"] == null
            ? []
            : List<Profile>.from(
                json["profile"]!.map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "profile": profile == null
            ? []
            : List<dynamic>.from(profile!.map((x) => x.toJson())),
      };
}

class Profile {
  int? id;
  dynamic googleId;
  String? image;
  String? email;
  String? fullname;
  String? nickname;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  Profile({
    this.id,
    this.googleId,
    this.image,
    this.email,
    this.fullname,
    this.nickname,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        googleId: json["google_id"],
        image: json["image"],
        email: json["email"],
        fullname: json["fullname"],
        nickname: json["nickname"],
        phoneNumber: json["phone_number"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "google_id": googleId,
        "image": image,
        "email": email,
        "fullname": fullname,
        "nickname": nickname,
        "phone_number": phoneNumber,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
