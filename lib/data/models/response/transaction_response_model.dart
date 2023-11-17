import 'dart:convert';

TransactionResponseModel transactionResponseModelFromJson(String str) =>
    TransactionResponseModel.fromJson(json.decode(str));

String transactionResponseModelToJson(TransactionResponseModel data) =>
    json.encode(data.toJson());

class TransactionResponseModel {
  final Vila vila;
  final int taxes;
  final int night;
  final int total;

  TransactionResponseModel({
    required this.vila,
    required this.taxes,
    required this.night,
    required this.total,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
        vila: Vila.fromJson(json["vila"]),
        taxes: json["taxes"],
        night: json["night"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "vila": vila.toJson(),
        "taxes": taxes,
        "night": night,
        "total": total,
      };
}

class Vila {
  final int id;
  final String name;
  final int price;
  final String location;
  final List<VilaImage> vilaImages;

  Vila({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.vilaImages,
  });

  factory Vila.fromJson(Map<String, dynamic> json) => Vila(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        location: json["location"],
        vilaImages: List<VilaImage>.from(
            json["VilaImages"].map((x) => VilaImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "location": location,
        "VilaImages": List<dynamic>.from(vilaImages.map((x) => x.toJson())),
      };
}

class VilaImage {
  final int id;
  final String sliderImage;

  VilaImage({
    required this.id,
    required this.sliderImage,
  });

  factory VilaImage.fromJson(Map<String, dynamic> json) => VilaImage(
        id: json["id"],
        sliderImage: json["slider_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
      };
}
