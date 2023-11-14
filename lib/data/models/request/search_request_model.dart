import 'dart:convert';

class SearchRequestModel {
  String searchText;

  SearchRequestModel({
    required this.searchText,
  });

  Map<String, dynamic> toMap() {
    return {
      'searchText': searchText,
    };
  }

  factory SearchRequestModel.fromMap(Map<String, dynamic> map) {
    return SearchRequestModel(
      searchText: map['searchText'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchRequestModel.fromJson(String source) =>
      SearchRequestModel.fromMap(json.decode(source));
}
