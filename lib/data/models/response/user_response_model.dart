
// import 'dart:convert';

// UserResponseModel userResponseModelFromJson(String str) => UserResponseModel.fromJson(json.decode(str));

// String userResponseModelToJson(UserResponseModel data) => json.encode(data.toJson());

// class UserResponseModel {
//     final int id;
//     final String googleId;
//     final String image;
//     final String email;
//     final String fullname;
//     final String nickname;
//     final String phoneNumber;
//     final DateTime createdAt;
//     final DateTime updatedAt;

//     UserResponseModel({
//         required this.id,
//         required this.googleId,
//         required this.image,
//         required this.email,
//         required this.fullname,
//         required this.nickname,
//         required this.phoneNumber,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
//         id: json["id"],
//         googleId: json["google_id"] ?? '',
//         image: json["image"],
//         email: json["email"],
//         fullname: json["fullname"],
//         nickname: json["nickname"],
//         phoneNumber: json["phone_number"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "google_id": googleId,
//         "image": image,
//         "email": email,
//         "fullname": fullname,
//         "nickname": nickname,
//         "phone_number": phoneNumber,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//     };
// }