import 'dart:convert';

HistoryResponseModel historyResponseModelFromJson(String str) =>
    HistoryResponseModel.fromJson(json.decode(str));

String historyResponseModelToJson(HistoryResponseModel data) =>
    json.encode(data.toJson());

class HistoryResponseModel {
  final String message;
  final List<AllTransaction> allTransactions;

  HistoryResponseModel({
    required this.message,
    required this.allTransactions,
  });

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? transactionsJson = json["allTransactions"];

    final List<AllTransaction> transactions = transactionsJson != null
        ? List<AllTransaction>.from(
            transactionsJson.map((x) => AllTransaction.fromJson(x)),
          )
        : [];

    return HistoryResponseModel(
      message: json["message"],
      allTransactions: transactions,
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "allTransactions":
            List<dynamic>.from(allTransactions.map((x) => x.toJson())),
      };
}

class AllTransaction {
  final int id;
  final DateTime tglCheckin;
  final DateTime tglCheckout;
  final String fullName;
  final DateTime createdAt;
  final Vilas vilas;
  final List<TransactionStatus> transactionStatuses;

  AllTransaction({
    required this.id,
    required this.tglCheckin,
    required this.tglCheckout,
    required this.fullName,
    required this.createdAt,
    required this.vilas,
    required this.transactionStatuses,
  });

  factory AllTransaction.fromJson(Map<String, dynamic> json) => AllTransaction(
        id: json["id"],
        tglCheckin: DateTime.parse(json["tgl_checkin"]),
        tglCheckout: DateTime.parse(json["tgl_checkout"]),
        fullName: json["full_name"],
        createdAt: DateTime.parse(json["createdAt"]),
        vilas: Vilas.fromJson(json["Vilas"]),
        transactionStatuses: List<TransactionStatus>.from(
            json["TransactionStatuses"]
                .map((x) => TransactionStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tgl_checkin": tglCheckin.toIso8601String(),
        "tgl_checkout": tglCheckout.toIso8601String(),
        "full_name": fullName,
        "createdAt": createdAt.toIso8601String(),
        "Vilas": vilas.toJson(),
        "TransactionStatuses":
            List<dynamic>.from(transactionStatuses.map((x) => x.toJson())),
      };
}

class TransactionStatus {
  final int id;
  final int statusId;

  TransactionStatus({
    required this.id,
    required this.statusId,
  });

  factory TransactionStatus.fromJson(Map<String, dynamic> json) =>
      TransactionStatus(
        id: json["id"],
        statusId: json["status_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status_id": statusId,
      };
}

class Vilas {
  final int id;
  final String name;
  final int price;
  final String location;
  final List<VilaImage> vilaImages;
  final List<Bookmark> bookmarks;

  Vilas({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.vilaImages,
    required this.bookmarks,
  });

  factory Vilas.fromJson(Map<String, dynamic> json) => Vilas(
        id: json["id"],
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        location: json["location"] ?? '',
        vilaImages: List<VilaImage>.from(
            json["VilaImages"].map((x) => VilaImage.fromJson(x))),
        bookmarks: List<Bookmark>.from(
            json["Bookmarks"].map((x) => Bookmark.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "location": location,
        "VilaImages": List<dynamic>.from(vilaImages.map((x) => x.toJson())),
        "Bookmarks": List<dynamic>.from(bookmarks.map((x) => x.toJson())),
      };
}

class Bookmark {
  final DateTime createdAt;

  Bookmark({
    required this.createdAt,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
      };
}

class VilaImage {
  final int id;
  final String sliderImage;

  VilaImage({
    required this.id,
    required this.sliderImage,
  });

  factory VilaImage.fromJson(Map<String, dynamic> json) => VilaImage(
        id: json["id"],
        sliderImage: json["slider_image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
      };
}
