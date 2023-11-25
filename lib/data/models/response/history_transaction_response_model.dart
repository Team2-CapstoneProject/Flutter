import 'dart:convert';

HistoryTransactionResponseModel historyTransactionResponseModelFromJson(
        String str) =>
    HistoryTransactionResponseModel.fromJson(json.decode(str));

String historyTransactionResponseModelToJson(
        HistoryTransactionResponseModel data) =>
    json.encode(data.toJson());

class HistoryTransactionResponseModel {
  final int id;
  final DateTime tglCheckin;
  final DateTime tglCheckout;
  final String fullName;
  final int nGuest;
  final int totalPrice;
  final int taxes;
  final String vilaName;
  final int vilaPrice;
  final String vilaLocation;
  final String vilaImage;
  final bool isBookmark;
  final int transactionStatus;
  final int reviewUserId;
  final int reviewScore;

  HistoryTransactionResponseModel({
    required this.id,
    required this.tglCheckin,
    required this.tglCheckout,
    required this.fullName,
    required this.nGuest,
    required this.totalPrice,
    required this.taxes,
    required this.vilaName,
    required this.vilaPrice,
    required this.vilaLocation,
    required this.vilaImage,
    required this.isBookmark,
    required this.transactionStatus,
    required this.reviewUserId,
    required this.reviewScore,
  });

  factory HistoryTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionResponseModel(
        id: json["id"],
        tglCheckin: DateTime.parse(json["tgl_checkin"]),
        tglCheckout: DateTime.parse(json["tgl_checkout"]),
        fullName: json["full_name"] ?? '',
        nGuest: json["n_guest"] ?? 0,
        totalPrice: json["total_price"] ?? 0,
        taxes: json["taxes"] ?? 0,
        vilaName: json["vila_name"] ?? '',
        vilaPrice: json["vila_price"] ?? 0,
        vilaLocation: json["vila_location"] ?? '',
        vilaImage: json["vila_image"] ?? '',
        isBookmark: json["is_bookmark"],
        transactionStatus: json["transaction_status"] ?? 0,
        reviewUserId: json["review_user_id"] ?? 0,
        reviewScore: json["review_score"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tgl_checkin": tglCheckin.toIso8601String(),
        "tgl_checkout": tglCheckout.toIso8601String(),
        "full_name": fullName,
        "n_guest": nGuest,
        "total_price": totalPrice,
        "taxes": taxes,
        "vila_name": vilaName,
        "vila_price": vilaPrice,
        "vila_location": vilaLocation,
        "vila_image": vilaImage,
        "is_bookmark": isBookmark,
        "transaction_status": transactionStatus,
        "review_user_id": reviewUserId,
        "review_score": reviewScore,
      };
}
