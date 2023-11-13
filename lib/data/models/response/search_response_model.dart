class SearchResponseModel {
  final String message;
  final UserData userData;
  final List<Vila> allVilas;
  final List<Vila> recommendVilas;
  final List<Vila> popularVilas;
  final List<Vila> ratingVilas;

  SearchResponseModel({
    required this.message,
    required this.userData,
    required this.allVilas,
    required this.recommendVilas,
    required this.popularVilas,
    required this.ratingVilas,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
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
}

class UserData {
  final int id;
  final String email;
  final String nickname;
  final int iat;

  UserData({
    required this.id,
    required this.email,
    required this.nickname,
    required this.iat,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"],
        iat: json["iat"],
      );
}

class Vila {
  final int id;
  final String name;
  final int price;
  final String location;
  final DateTime updatedAt;
  final VilaImages vilaImages;
  // final List<Transaction> transactions;
  // final List<Bookmark> bookmarks;
  final int nBookmark;
  final int nTransaction;
  final int nReview;
  final double? score;

  Vila({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.updatedAt,
    required this.vilaImages,
    // required this.transactions,
    // required this.bookmarks,
    required this.nBookmark,
    required this.nTransaction,
    required this.nReview,
    this.score,
  });

  factory Vila.fromJson(Map<String, dynamic> json) => Vila(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        location: json["location"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        vilaImages: VilaImages.fromJson(json["VilaImages"]),
        // transactions: List<Transaction>.from(
        //     json["Transactions"].map((x) => Transaction.fromJson(x))),
        // bookmarks: List<Bookmark>.from(
        //     json["Bookmarks"].map((x) => Bookmark.fromJson(x))),
        nBookmark: json["nBookmark"],
        nTransaction: json["nTransaction"],
        nReview: json["nReview"],
        score: json["score"],
      );
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
        sliderImage: json["slider_image"],
      );
}

// class Transaction {
// }

// class Bookmark {
// }
