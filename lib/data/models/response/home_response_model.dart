// import 'dart:convert';

// HomeResponseModel homeResponseModelFromJson(String str) =>
//     HomeResponseModel.fromJson(json.decode(str));

// String homeResponseModelToJson(HomeResponseModel data) =>
//     json.encode(data.toJson());

// class HomeResponseModel {
//   final String message;
//   final UserData userData;
//   final List<Vila> allVilas;
//   final List<Vila> recommendVilas;
//   final List<Vila> popularVilas;
//   final List<Vila> ratingVilas;

//   HomeResponseModel({
//     required this.message,
//     required this.userData,
//     required this.allVilas,
//     required this.recommendVilas,
//     required this.popularVilas,
//     required this.ratingVilas,
//   });

//   factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
//       HomeResponseModel(
//         message: json["message"],
//         userData: UserData.fromJson(json["userData"]),
//         allVilas:
//             List<Vila>.from(json["allVilas"].map((x) => Vila.fromJson(x))),
//         recommendVilas: List<Vila>.from(
//             json["recommendVilas"].map((x) => Vila.fromJson(x))),
//         popularVilas:
//             List<Vila>.from(json["popularVilas"].map((x) => Vila.fromJson(x))),
//         ratingVilas:
//             List<Vila>.from(json["ratingVilas"].map((x) => Vila.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "userData": userData.toJson(),
//         "allVilas": List<dynamic>.from(allVilas.map((x) => x.toJson())),
//         "recommendVilas":
//             List<dynamic>.from(recommendVilas.map((x) => x.toJson())),
//         "popularVilas": List<dynamic>.from(popularVilas.map((x) => x.toJson())),
//         "ratingVilas": List<dynamic>.from(ratingVilas.map((x) => x.toJson())),
//       };
// }

// class Vila {
//   final int id;
//   final String name;
//   final int price;
//   final String location;
//   final DateTime updatedAt;
//   final VilaImages vilaImages;
//   final List<Transaction> transactions;
//   final List<Bookmark> bookmarks;
//   final int nBookmark;
//   final int nTransaction;
//   final int nReview;
//   final double? score;

//   Vila({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.location,
//     required this.updatedAt,
//     required this.vilaImages,
//     required this.transactions,
//     required this.bookmarks,
//     required this.nBookmark,
//     required this.nTransaction,
//     required this.nReview,
//     this.score,
//   });

//   factory Vila.fromJson(Map<String, dynamic> json) => Vila(
//         id: json["id"] ?? 0,
//         name: json["name"] ?? '',
//         price: json["price"] ?? 0,
//         location: json["location"] ?? '',
//         updatedAt: DateTime.parse(json["updatedAt"] ?? ''),
//         vilaImages: VilaImages.fromJson(json["VilaImages"] ?? {}),
//         transactions: List<Transaction>.from(
//             json["Transactions"].map((x) => Transaction.fromJson(x))),
//         bookmarks: List<Bookmark>.from(
//             json["Bookmarks"].map((x) => Bookmark.fromJson(x))),
//         nBookmark: json["nBookmark"] ?? 0,
//         nTransaction: json["nTransaction"] ?? 0,
//         nReview: json["nReview"] ?? 0,
//         score: json["score"] == null ? null : json["score"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "location": location,
//         "updatedAt": updatedAt.toIso8601String(),
//         "VilaImages": vilaImages.toJson(),
//         "Transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
//         "Bookmarks": List<dynamic>.from(bookmarks.map((x) => x.toJson())),
//         "nBookmark": nBookmark,
//         "nTransaction": nTransaction,
//         "nReview": nReview,
//         "score": score,
//       };
// }

// class Bookmark {
//   final int id;

//   Bookmark({
//     required this.id,
//   });

//   factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//       };
// }

// class Transaction {
//   final int id;
//   final DateTime createdAt;
//   final List<Review> reviews;

//   Transaction({
//     required this.id,
//     required this.createdAt,
//     required this.reviews,
//   });

//   factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
//         id: json["id"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         reviews:
//             List<Review>.from(json["Reviews"].map((x) => Review.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "createdAt": createdAt.toIso8601String(),
//         "Reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
//       };
// }

// class Review {
//   final int id;
//   final int score;
//   final DateTime? createdAt;

//   Review({
//     required this.id,
//     required this.score,
//     this.createdAt,
//   });

//   factory Review.fromJson(Map<String, dynamic> json) => Review(
//         id: json["id"] ?? 0,
//         score: json["score"] ?? '',
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "score": score,
//         "createdAt": createdAt?.toIso8601String(),
//       };
// }

// class VilaImages {
//   final int id;
//   final String sliderImage;

//   VilaImages({
//     required this.id,
//     required this.sliderImage,
//   });

//   factory VilaImages.fromJson(Map<String, dynamic> json) => VilaImages(
//         id: json["id"] ?? 0,
//         sliderImage: json["slider_image"] ??
//             'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "slider_image": sliderImage,
//       };
// }

// class UserData {
//   final int id;
//   final String googleId;
//   final String image;
//   final String email;
//   final String fullname;
//   final String nickname;
//   final String password;
//   final String phoneNumber;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   UserData({
//     required this.id,
//     required this.googleId,
//     required this.image,
//     required this.email,
//     required this.fullname,
//     required this.nickname,
//     required this.password,
//     required this.phoneNumber,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         id: json["id"],
//         googleId: json["google_id"] ?? '',
//         image: json["image"] ?? '',
//         email: json["email"] ?? '',
//         fullname: json["fullname"] ?? '',
//         nickname: json["nickname"] ?? '',
//         password: json["password"] ?? '',
//         phoneNumber: json["phone_number"] ?? '',
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "google_id": googleId,
//         "image": image,
//         "email": email,
//         "fullname": fullname,
//         "nickname": nickname,
//         "password": password,
//         "phone_number": phoneNumber,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }

import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String homeResponseModelToJson(HomeResponseModel data) =>
    json.encode(data.toJson());

class HomeResponseModel {
  final String message;
  final UserData userData;
  final List<Vila> allVilas;
  final List<Vila> recommendVilas;
  final List<Vila> popularVilas;
  final List<Vila> ratingVilas;

  HomeResponseModel({
    required this.message,
    required this.userData,
    required this.allVilas,
    required this.recommendVilas,
    required this.popularVilas,
    required this.ratingVilas,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        message: json["message"],
        userData: UserData.fromJson(json["userData"]),
        allVilas:
            List<Vila>.from(json["allVilas"].map((x) => Vila.fromJson(x))),
        recommendVilas: List<Vila>.from(
            json["recommendVilas"].map((x) => Vila.fromJson(x))),
        popularVilas:
            List<Vila>.from(json["popularVilas"].map((x) => Vila.fromJson(x))),
        ratingVilas:
            List<Vila>.from(json["ratingVilas"].map((x) => Vila.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userData": userData.toJson(),
        "allVilas": List<dynamic>.from(allVilas.map((x) => x.toJson())),
        "recommendVilas":
            List<dynamic>.from(recommendVilas.map((x) => x.toJson())),
        "popularVilas": List<dynamic>.from(popularVilas.map((x) => x.toJson())),
        "ratingVilas": List<dynamic>.from(ratingVilas.map((x) => x.toJson())),
      };
}

class Vila {
  final int id;
  final String name;
  final int price;
  final String location;
  final DateTime updatedAt;
  final VilaImages vilaImages;
  final List<Transaction> transactions;
  final List<Bookmark> bookmarks;
  final int jumlahBookmark;
  final int jumlahTransaction;
  final int nReview;
  final int score;

  Vila({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.updatedAt,
    required this.vilaImages,
    required this.transactions,
    required this.bookmarks,
    required this.jumlahBookmark,
    required this.jumlahTransaction,
    required this.nReview,
    required this.score,
  });

  factory Vila.fromJson(Map<String, dynamic> json) => Vila(
        id: json["id"],
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        location: json["location"] ?? '',
        updatedAt: DateTime.parse(json["updatedAt"]),
        vilaImages: VilaImages.fromJson(json["VilaImages"]),
        transactions: List<Transaction>.from(
            json["Transactions"].map((x) => Transaction.fromJson(x))),
        bookmarks: List<Bookmark>.from(
            json["Bookmarks"].map((x) => Bookmark.fromJson(x))),
        jumlahBookmark: json["jumlahBookmark"] ?? 0,
        jumlahTransaction: json["jumlahTransaction"] ?? 0,
        nReview: json["nReview"] ?? 0,
        score: json["score"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "location": location,
        "updatedAt": updatedAt.toIso8601String(),
        "VilaImages": vilaImages.toJson(),
        "Transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
        "Bookmarks": List<dynamic>.from(bookmarks.map((x) => x.toJson())),
        "jumlahBookmark": jumlahBookmark,
        "jumlahTransaction": jumlahTransaction,
        "nReview": nReview,
        "score": score,
      };
}

class Bookmark {
  final int id;

  Bookmark({
    required this.id,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Transaction {
  final int id;
  final DateTime createdAt;
  final List<Review> reviews;

  Transaction({
    required this.id,
    required this.createdAt,
    required this.reviews,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        reviews:
            List<Review>.from(json["Reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "Reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Review {
  final int id;
  final int score;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.score,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        score: json["score"] ?? 0,
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "score": score,
        "createdAt": createdAt.toIso8601String(),
      };
}

class VilaImages {
  final int id;
  final String sliderImage;

  VilaImages({
    required this.id,
    required this.sliderImage,
  });

  factory VilaImages.fromJson(Map<String, dynamic> json) => VilaImages(
        id: json["id"],
        sliderImage: json["slider_image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
      };
}

class UserData {
  final int id;
  final String googleId;
  final String image;
  final String email;
  final String fullname;
  final String nickname;
  final String password;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserData({
    required this.id,
    required this.googleId,
    required this.image,
    required this.email,
    required this.fullname,
    required this.nickname,
    required this.password,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        googleId: json["google_id"] ?? '',
        image: json["image"] ?? '',
        email: json["email"] ?? '',
        fullname: json["fullname"] ?? '',
        nickname: json["nickname"] ?? '',
        password: json["password"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
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
        "password": password,
        "phone_number": phoneNumber,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
