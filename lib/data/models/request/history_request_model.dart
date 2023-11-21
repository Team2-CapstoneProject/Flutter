import 'dart:convert';

class HistoryRequestModel {
  final String transactionType;
  HistoryRequestModel({
    required this.transactionType,
  });

  Map<String, dynamic> toMap() {
    return {
      'transactionType': transactionType,
    };
  }

  factory HistoryRequestModel.fromMap(Map<String, dynamic> map) {
    return HistoryRequestModel(
      transactionType: map['transactionType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryRequestModel.fromJson(String source) =>
      HistoryRequestModel.fromMap(json.decode(source));
}
