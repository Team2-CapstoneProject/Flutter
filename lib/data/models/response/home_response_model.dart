import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String homeResponseModelToJson(HomeResponseModel data) =>
    json.encode(data.toJson());

class HomeResponseModel {
  final String? message;
  final UserData? userData;
  final List<Vila>? allVilas;
  final List<Vila>? recommendVilas;
  final List<Vila>? popularVilas;
  final List<Vila>? ratingVilas;

  HomeResponseModel({
    this.message,
    this.userData,
    this.allVilas,
    this.recommendVilas,
    this.popularVilas,
    this.ratingVilas,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        message: json["message"],
        userData: json["userData"] == null
            ? null
            : UserData.fromJson(json["userData"]),
        allVilas: json["allVilas"] == null
            ? []
            : List<Vila>.from(json["allVilas"]!.map((x) => Vila.fromJson(x))),
        recommendVilas: json["recommendVilas"] == null
            ? []
            : List<Vila>.from(
                json["recommendVilas"]!.map((x) => Vila.fromJson(x))),
        popularVilas: json["popularVilas"] == null
            ? []
            : List<Vila>.from(
                json["popularVilas"]!.map((x) => Vila.fromJson(x))),
        ratingVilas: json["ratingVilas"] == null
            ? []
            : List<Vila>.from(
                json["ratingVilas"]!.map((x) => Vila.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userData": userData?.toJson(),
        "allVilas": allVilas == null
            ? []
            : List<dynamic>.from(allVilas!.map((x) => x.toJson())),
        "recommendVilas": recommendVilas == null
            ? []
            : List<dynamic>.from(recommendVilas!.map((x) => x.toJson())),
        "popularVilas": popularVilas == null
            ? []
            : List<dynamic>.from(popularVilas!.map((x) => x.toJson())),
        "ratingVilas": ratingVilas == null
            ? []
            : List<dynamic>.from(ratingVilas!.map((x) => x.toJson())),
      };
}

class Vila {
  final int? id;
  final String? name;
  final int? price;
  final String? location;
  final DateTime? updatedAt;
  final List<Transaction>? transactions;
  final List<Bookmark>? bookmarks;
  final int? nBookmark;
  final int? nTransaction;
  final int? nReview;
  final double? score;
  final VilaImages? vilaImages;

  Vila({
    this.id,
    this.name,
    this.price,
    this.location,
    this.updatedAt,
    this.transactions,
    this.bookmarks,
    this.nBookmark,
    this.nTransaction,
    this.nReview,
    this.score,
    this.vilaImages,
  });

  factory Vila.fromJson(Map<String, dynamic> json) => Vila(
        id: json["id"],
        name: json["name"] as String,
        price: json["price"],
        location: json["location"] as String,
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        transactions: json["Transactions"] == null
            ? []
            : List<Transaction>.from(
                json["Transactions"]!.map((x) => Transaction.fromJson(x))),
        bookmarks: json["Bookmarks"] == null
            ? []
            : List<Bookmark>.from(
                json["Bookmarks"]!.map((x) => Bookmark.fromJson(x))),
        nBookmark: json["nBookmark"],
        nTransaction: json["nTransaction"],
        nReview: json["nReview"],
        score: json["score"]?.toDouble(),
        vilaImages: json["VilaImages"] == null
            ? null
            : VilaImages.fromJson(json["VilaImages"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name ?? '',
        "price": price,
        "location": location ?? '',
        "updatedAt": updatedAt?.toIso8601String(),
        "Transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "Bookmarks": bookmarks == null
            ? []
            : List<dynamic>.from(bookmarks!.map((x) => x.toJson())),
        "nBookmark": nBookmark,
        "nTransaction": nTransaction,
        "nReview": nReview,
        "score": score,
        "VilaImages": vilaImages?.toJson(),
      };
}

class Bookmark {
  final int? id;

  Bookmark({
    this.id,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Transaction {
  final int? id;
  final DateTime? createdAt;
  final List<Review>? reviews;

  Transaction({
    this.id,
    this.createdAt,
    this.reviews,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        reviews: json["Reviews"] == null
            ? []
            : List<Review>.from(
                json["Reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "Reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class Review {
  final int? id;
  final int? score;
  final DateTime? createdAt;

  Review({
    this.id,
    this.score,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        score: json["score"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "score": score,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class VilaImages {
  final int? id;
  final String? sliderImage;

  VilaImages({
    this.id,
    this.sliderImage,
  });

  factory VilaImages.fromJson(Map<String, dynamic> json) => VilaImages(
        id: json["id"],
        sliderImage: json["slider_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
      };
}

class UserData {
  final int? id;
  final String? email;
  final String? nickname;
  final int? iat;

  UserData({
    this.id,
    this.email,
    this.nickname,
    this.iat,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"],
        iat: json["iat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickname": nickname,
        "iat": iat,
      };
}
