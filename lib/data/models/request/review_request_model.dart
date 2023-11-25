import 'dart:convert';

class ReviewRequestModel {
  final int transactionId;
  final int score;
  final String description;

  ReviewRequestModel(
      {required this.transactionId,
      required this.score,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'transactionId': transactionId,
      'score': score,
      'description': description,
    };
  }

  factory ReviewRequestModel.fromMap(Map<String, dynamic> map) {
    return ReviewRequestModel(
      transactionId: map['transactionId'],
      score: map['score']?.toInt() ?? 0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewRequestModel.fromJson(String source) =>
      ReviewRequestModel.fromMap(json.decode(source));
}
