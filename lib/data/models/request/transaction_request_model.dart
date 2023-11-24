import 'dart:convert';

class TransactionRequestModel {
  int vilaId;
  int nNight;
  String tglCheckin;
  String tglCheckout;
  TransactionRequestModel({
    required this.vilaId,
    required this.nNight,
    required this.tglCheckin,
    required this.tglCheckout,
  });

  Map<String, dynamic> toMap() {
    return {
      'vilaId': vilaId,
      'nNight': nNight,
      'tglCheckin': tglCheckin,
      'tglCheckout': tglCheckout,
    };
  }

  factory TransactionRequestModel.fromMap(Map<String, dynamic> map) {
    return TransactionRequestModel(
      vilaId: map['vilaId']?.toInt() ?? 0,
      nNight: map['nNight']?.toInt() ?? 0,
      tglCheckin: map['tglCheckin'] ?? '',
      tglCheckout: map['tglCheckout'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionRequestModel.fromJson(String source) =>
      TransactionRequestModel.fromMap(json.decode(source));
}
