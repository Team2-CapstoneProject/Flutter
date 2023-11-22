class BookmarkResponModel {
  final String message;
  final List<BookmarkedVila>? bookmarkedVila;

  BookmarkResponModel({
    required this.message,
    this.bookmarkedVila,
  });

  factory BookmarkResponModel.fromJson(Map<String, dynamic> json) {
    if (json["bookmarkedVila"] != null) {
      return BookmarkResponModel(
        message: json["message"],
        bookmarkedVila: List<BookmarkedVila>.from(
            json["bookmarkedVila"].map((x) => BookmarkedVila.fromJson(x))),
      );
    } else {
      return BookmarkResponModel(message: json["message"]);
    }
  }
}

class BookmarkedVila {
  final int id;
  final DateTime updatedAt;
  final int vila_id;
  final String vila_name;
  final String vila_location;
  final int vila_price;
  final String vila_image;

  BookmarkedVila({
    required this.id,
    required this.updatedAt,
    required this.vila_id,
    required this.vila_name,
    required this.vila_location,
    required this.vila_price,
    required this.vila_image,
  });

  factory BookmarkedVila.fromJson(Map<String, dynamic> json) => BookmarkedVila(
        id: json["id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        vila_id: json["vila_id"],
        vila_name: json["vila_name"],
        vila_location: json["vila_location"],
        vila_price: json["vila_price"],
        vila_image: json["vila_image"],
      );
}
