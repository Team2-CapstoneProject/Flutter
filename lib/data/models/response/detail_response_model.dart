import 'dart:convert';

DetailResponseModel detailResponseModelFromJson(String str) =>
    DetailResponseModel.fromJson(json.decode(str));

String detailResponseModelToJson(DetailResponseModel data) =>
    json.encode(data.toJson());

class DetailResponseModel {
  final String message;
  final List<Vila> vila;

  DetailResponseModel({
    required this.message,
    required this.vila,
  });

  factory DetailResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailResponseModel(
        message: json["message"] ?? '',
        vila: List<Vila>.from(json["vila"].map((x) => Vila.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "vila": List<dynamic>.from(vila.map((x) => x.toJson())),
      };
}

class Vila {
  final int id;
  final String name;
  final int price;
  final String description;
  final String location;
  final int latitude;
  final int longitude;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<VilaImage> vilaImages;
  final List<Transaction> transactions;
  final List<VilaFacility> vilaFacilities;

  Vila({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.vilaImages,
    required this.transactions,
    required this.vilaFacilities,
  });

  factory Vila.fromJson(Map<String, dynamic> json) => Vila(
        id: json["id"],
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        description: json["description"] ?? '',
        location: json["location"] ?? '',
        latitude: json["latitude"] ?? 0,
        longitude: json["longitude"] ?? 0,
        status: json["status"] ?? 0,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        vilaImages: List<VilaImage>.from(
            json["VilaImages"].map((x) => VilaImage.fromJson(x))),
        transactions: List<Transaction>.from(
            json["Transactions"].map((x) => Transaction.fromJson(x))),
        vilaFacilities: List<VilaFacility>.from(
            json["VilaFacilities"].map((x) => VilaFacility.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "VilaImages": List<dynamic>.from(vilaImages.map((x) => x.toJson())),
        "Transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
        "VilaFacilities":
            List<dynamic>.from(vilaFacilities.map((x) => x.toJson())),
      };
}

class Transaction {
  final int id;
  final Users users;
  final List<Review> reviews;

  Transaction({
    required this.id,
    required this.users,
    required this.reviews,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        users: Users.fromJson(json["Users"]),
        reviews:
            List<Review>.from(json["Reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Users": users.toJson(),
        "Reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Review {
  final int id;
  final double score;
  final String description;
  final DateTime updatedAt;

  Review({
    required this.id,
    required this.score,
    required this.description,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        description: json["description"] ?? '',
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "score": score,
        "description": description,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Users {
  final int id;
  final String image;
  final String fullname;

  Users({
    required this.id,
    required this.image,
    required this.fullname,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        image: json["image"] ?? '',
        fullname: json["fullname"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "fullname": fullname,
      };
}

class VilaFacility {
  final int id;
  final Facilities facilities;

  VilaFacility({
    required this.id,
    required this.facilities,
  });

  factory VilaFacility.fromJson(Map<String, dynamic> json) => VilaFacility(
        id: json["id"],
        facilities: Facilities.fromJson(json["Facilities"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Facilities": facilities.toJson(),
      };
}

class Facilities {
  final String label;
  final String icon;

  Facilities({
    required this.label,
    required this.icon,
  });

  factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        label: json["label"] ?? '',
        icon: json["icon"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
      };
}

class VilaImage {
  final int id;
  final String sliderImage;
  final DateTime updatedAt;

  VilaImage({
    required this.id,
    required this.sliderImage,
    required this.updatedAt,
  });

  factory VilaImage.fromJson(Map<String, dynamic> json) => VilaImage(
        id: json["id"],
        sliderImage: json["slider_image"] ?? '',
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
