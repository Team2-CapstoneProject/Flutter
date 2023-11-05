import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) => HomeResponseModel.fromJson(json.decode(str));

String homeResponseModelToJson(HomeResponseModel data) => json.encode(data.toJson());

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

    factory HomeResponseModel.fromJson(Map<String, dynamic> json) => HomeResponseModel(
        message: json["message"],
        userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
        allVilas: json["allVilas"] == null ? [] : List<Vila>.from(json["allVilas"]!.map((x) => Vila.fromJson(x))),
        recommendVilas: json["recommendVilas"] == null ? [] : List<Vila>.from(json["recommendVilas"]!.map((x) => Vila.fromJson(x))),
        popularVilas: json["popularVilas"] == null ? [] : List<Vila>.from(json["popularVilas"]!.map((x) => Vila.fromJson(x))),
        ratingVilas: json["ratingVilas"] == null ? [] : List<Vila>.from(json["ratingVilas"]!.map((x) => Vila.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "userData": userData?.toJson(),
        "allVilas": allVilas == null ? [] : List<dynamic>.from(allVilas!.map((x) => x.toJson())),
        "recommendVilas": recommendVilas == null ? [] : List<dynamic>.from(recommendVilas!.map((x) => x.toJson())),
        "popularVilas": popularVilas == null ? [] : List<dynamic>.from(popularVilas!.map((x) => x.toJson())),
        "ratingVilas": ratingVilas == null ? [] : List<dynamic>.from(ratingVilas!.map((x) => x.toJson())),
    };
}

class Vila {
    final int? id;
    final Name? name;
    final int? price;
    final Location? location;
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
        name: nameValues.map[json["name"]]!,
        price: json["price"],
        location: locationValues.map[json["location"]]!,
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        transactions: json["Transactions"] == null ? [] : List<Transaction>.from(json["Transactions"]!.map((x) => Transaction.fromJson(x))),
        bookmarks: json["Bookmarks"] == null ? [] : List<Bookmark>.from(json["Bookmarks"]!.map((x) => Bookmark.fromJson(x))),
        nBookmark: json["nBookmark"],
        nTransaction: json["nTransaction"],
        nReview: json["nReview"],
        score: json["score"]?.toDouble(),
        vilaImages: json["VilaImages"] == null ? null : VilaImages.fromJson(json["VilaImages"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "price": price,
        "location": locationValues.reverse[location],
        "updatedAt": updatedAt?.toIso8601String(),
        "Transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "Bookmarks": bookmarks == null ? [] : List<dynamic>.from(bookmarks!.map((x) => x.toJson())),
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

enum Location {
    JALAN_BATU_BELIG_80361_SEMINYAK_INDONESIA,
    JALAN_BATU_BELIG_GANG_GELATIK_80361_SEMINYAK_INDONESIA,
    NO_29_JALAN_KUBU_ANYAR_80361_KUTA_INDONESIA
}

final locationValues = EnumValues({
    "Jalan Batu Belig, 80361 Seminyak, Indonesia": Location.JALAN_BATU_BELIG_80361_SEMINYAK_INDONESIA,
    "Jalan Batu Belig, Gang Gelatik, 80361 Seminyak, Indonesia": Location.JALAN_BATU_BELIG_GANG_GELATIK_80361_SEMINYAK_INDONESIA,
    "No.29 Jalan Kubu Anyar, 80361 Kuta, Indonesia": Location.NO_29_JALAN_KUBU_ANYAR_80361_KUTA_INDONESIA
});

enum Name {
    CASA_BATU_BELIG,
    HOLIDAY_VILLA_KUTA_REGENCY_B8,
    VILLA_RENDEZVOUS_BALI
}

final nameValues = EnumValues({
    "Casa Batu Belig": Name.CASA_BATU_BELIG,
    "Holiday Villa - Kuta Regency B8": Name.HOLIDAY_VILLA_KUTA_REGENCY_B8,
    "Villa Rendezvous Bali": Name.VILLA_RENDEZVOUS_BALI
});

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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        reviews: json["Reviews"] == null ? [] : List<Review>.from(json["Reviews"]!.map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "Reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
