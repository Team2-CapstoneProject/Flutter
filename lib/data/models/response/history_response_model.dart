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

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryResponseModel(
        message: json["message"] ?? '',
        allTransactions: (json["allTransactions"] as List<dynamic>?)
                ?.map((x) => AllTransaction.fromJson(x))
                .toList() ??
            [],
      );

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
  final List<dynamic>? transactionStatuses;

  AllTransaction({
    required this.id,
    required this.tglCheckin,
    required this.tglCheckout,
    required this.fullName,
    required this.createdAt,
    required this.vilas,
    this.transactionStatuses,
  });

  factory AllTransaction.fromJson(Map<String, dynamic> json) => AllTransaction(
        id: json["id"],
        tglCheckin: DateTime.parse(json["tgl_checkin"]),
        tglCheckout: DateTime.parse(json["tgl_checkout"]),
        fullName: json["full_name"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
        vilas: Vilas.fromJson(json["Vilas"]),
        transactionStatuses: (json["TransactionStatuses"] as List<dynamic>?)
                ?.map((x) => x)
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tgl_checkin": tglCheckin.toIso8601String(),
        "tgl_checkout": tglCheckout.toIso8601String(),
        "full_name": fullName,
        "createdAt": createdAt.toIso8601String(),
        "Vilas": vilas.toJson(),
        "TransactionStatuses": transactionStatuses == null
            ? []
            : List<dynamic>.from(transactionStatuses!.map((x) => x)),
      };
}

class Vilas {
  final int id;
  final String name;
  final int price;
  final String location;
  final List<VilaImage> vilaImages;
  final List<dynamic>? bookmarks;

  Vilas({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.vilaImages,
    this.bookmarks,
  });

  factory Vilas.fromJson(Map<String, dynamic> json) => Vilas(
        id: json["id"],
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        location: json["location"] ?? '',
        vilaImages: (json["VilaImages"] as List<dynamic>?)
                ?.map((x) => VilaImage.fromJson(x))
                .toList() ??
            [],
        bookmarks:
            (json["Bookmarks"] as List<dynamic>?)?.map((x) => x).toList() ?? [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "location": location,
        "VilaImages": List<dynamic>.from(vilaImages.map((x) => x.toJson())),
        "Bookmarks": bookmarks == null
            ? []
            : List<dynamic>.from(bookmarks!.map((x) => x)),
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
