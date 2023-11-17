import 'dart:convert';

class TransactionRequestModel {
  int vila_id;
  int n_night;
  TransactionRequestModel({
    required this.vila_id,
    required this.n_night,
  });

  Map<String, dynamic> toMap() {
    return {
      'vila_id': vila_id,
      'n_night': n_night,
    };
  }

  factory TransactionRequestModel.fromMap(Map<String, dynamic> map) {
    return TransactionRequestModel(
      vila_id: map['vila_id']?.toInt() ?? 0,
      n_night: map['n_night']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionRequestModel.fromJson(String source) =>
      TransactionRequestModel.fromMap(json.decode(source));
}
