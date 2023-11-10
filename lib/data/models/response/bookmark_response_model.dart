import 'dart:convert';

BookmarkResponModel bookmarkResponModelFromJson(String str) => BookmarkResponModel.fromJson(json.decode(str));

String bookmarkResponModelToJson(BookmarkResponModel data) => json.encode(data.toJson());

class BookmarkResponModel {
    final String message;
    final List<BookmarkedVila> bookmarkedVila;

    BookmarkResponModel({
        required this.message,
        required this.bookmarkedVila,
    });

    factory BookmarkResponModel.fromJson(Map<String, dynamic> json) => BookmarkResponModel(
        message: json["message"],
        bookmarkedVila: List<BookmarkedVila>.from(json["bookmarkedVila"].map((x) => BookmarkedVila.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "bookmarkedVila": List<dynamic>.from(bookmarkedVila.map((x) => x.toJson())),
    };
}

class BookmarkedVila {
    final int id;
    final DateTime updatedAt;
    final Vilas vilas;

    BookmarkedVila({
        required this.id,
        required this.updatedAt,
        required this.vilas,
    });

    factory BookmarkedVila.fromJson(Map<String, dynamic> json) => BookmarkedVila(
        id: json["id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        vilas: Vilas.fromJson(json["Vilas"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "Vilas": vilas.toJson(),
    };
}

class Vilas {
    final int id;
    final String name;
    final String location;
    final int price;

    Vilas({
        required this.id,
        required this.name,
        required this.location,
        required this.price,
    });

    factory Vilas.fromJson(Map<String, dynamic> json) => Vilas(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "price": price,
    };
}
