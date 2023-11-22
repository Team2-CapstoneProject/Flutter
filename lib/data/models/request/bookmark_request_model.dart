import 'dart:convert';

class BookmarkRequestModel {
  int id;

  BookmarkRequestModel({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'vilaId': id,
    };
  }

  factory BookmarkRequestModel.fromMap(Map<String, dynamic> map) {
    return BookmarkRequestModel(
      id: map['vilaId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookmarkRequestModel.fromJson(String source) =>
      BookmarkRequestModel.fromMap(json.decode(source));
}
