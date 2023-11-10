// import 'dart:convert';

// DetailResponModel detailResponModelFromJson(String str) =>
//     DetailResponModel.fromJson(json.decode(str));

// String detailResponModelToJson(DetailResponModel data) =>
//     json.encode(data.toJson());

// class DetailResponModel {
//   final String message;
//   final List<Vila> vila;

//   DetailResponModel({
//     required this.message,
//     required this.vila,
//   });

//   factory DetailResponModel.fromJson(Map<String, dynamic> json) =>
//       DetailResponModel(
//         message: json["message"],
//         vila: json["vila"],
//       );

//   Map<String, dynamic> toJson() => {"message": message, "vila": vila};
// }

// class Vila {
//   final int id;
//   final String name;
//   final int price;
//   final String description;
//   final String location;
//   final int? latitude;
//   final int? longitude;
//   //final dynamic status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final List<VilaImage> vilaImages;
//   //final List<dynamic>? transactions;
//   //final List<VilaFacility>? vilaFacilities;

//   Vila({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.location,
//     this.latitude,
//     this.longitude,
//     //this.status,
//     this.createdAt,
//     this.updatedAt,
//     required this.vilaImages,
//     //this.transactions,
//     //this.vilaFacilities,
//   });

//   factory Vila.fromJson(Map<String, dynamic> json) => Vila(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         description: json["description"],
//         location: json["location"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         //status: json["status"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         vilaImages: List<VilaImage>.from(
//             json["VilaImages"].map((x) => VilaImage.fromJson(x))),
//         // transactions: json["Transactions"] == null
//         //     ? []
//         //     : List<dynamic>.from(json["Transactions"]!.map((x) => x)),
//         // vilaFacilities: json["VilaFacilities"] == null
//         //     ? []
//         //     : List<VilaFacility>.from(
//         //         json["VilaFacilities"]!.map((x) => VilaFacility.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "description": description,
//         "location": location,
//         "latitude": latitude,
//         "longitude": longitude,
//         //"status": status,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "VilaImages": List<dynamic>.from(vilaImages.map((x) => x.toJson())),
//         // "Transactions": transactions == null
//         //     ? []
//         //     : List<dynamic>.from(transactions!.map((x) => x)),
//         // "VilaFacilities": vilaFacilities == null
//         //     ? []
//         //     : List<dynamic>.from(vilaFacilities!.map((x) => x.toJson())),
//       };
// }

// class VilaFacility {
//   final int? id;
//   final Facilities? facilities;

//   VilaFacility({
//     this.id,
//     this.facilities,
//   });

//   factory VilaFacility.fromJson(Map<String, dynamic> json) => VilaFacility(
//         id: json["id"],
//         facilities: json["Facilities"] == null
//             ? null
//             : Facilities.fromJson(json["Facilities"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "Facilities": facilities?.toJson(),
//       };
// }

// class Facilities {
//   final String? label;
//   final String? icon;

//   Facilities({
//     this.label,
//     this.icon,
//   });

//   factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
//         label: json["label"],
//         icon: json["icon"],
//       );

//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "icon": icon,
//       };
// }

// class VilaImage {
//   final int id;
//   final String sliderImage;
//   final DateTime updatedAt;

//   VilaImage({
//     required this.id,
//     required this.sliderImage,
//     required this.updatedAt,
//   });

//   factory VilaImage.fromJson(Map<String, dynamic> json) => VilaImage(
//       id: json["id"],
//       sliderImage: json["slider_image"],
//       updatedAt: json["updatedAt"]);

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "slider_image": sliderImage,
//         "updatedAt": updatedAt,
//       };
// }

import 'dart:convert';

DetailResponModel detailResponModelFromJson(String str) =>
    DetailResponModel.fromJson(json.decode(str));

String detailResponModelToJson(DetailResponModel data) =>
    json.encode(data.toJson());

class DetailResponModel {
  final String message;
  final List<Vila> vila;

  DetailResponModel({
    required this.message,
    required this.vila,
  });

  factory DetailResponModel.fromJson(Map<String, dynamic> json) =>
      DetailResponModel(
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
  final dynamic status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<VilaImage> vilaImages;
  final List<dynamic> transactions;
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
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        description: json["description"] ?? '',
        location: json["location"] ?? '',
        latitude: json["latitude"] ?? 0,
        longitude: json["longitude"] ?? 0,
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        vilaImages: List<VilaImage>.from(
            json["VilaImages"].map((x) => VilaImage.fromJson(x))),
        transactions: List<dynamic>.from(json["Transactions"].map((x) => x)),
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
        "Transactions": List<dynamic>.from(transactions.map((x) => x)),
        "VilaFacilities":
            List<dynamic>.from(vilaFacilities.map((x) => x.toJson())),
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
        id: json["id"] ?? 0,
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
        id: json["id"] ?? 0,
        sliderImage: json["slider_image"] ?? '',
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
