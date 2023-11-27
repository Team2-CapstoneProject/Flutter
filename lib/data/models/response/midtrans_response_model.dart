import 'dart:convert';

MidtransResponseModel midtransResponseModelFromJson(String str) => MidtransResponseModel.fromJson(json.decode(str));

String midtransResponseModelToJson(MidtransResponseModel data) => json.encode(data.toJson());

class MidtransResponseModel {
    final String message;
    final String transactionToken;
    final String transactionUrl;

    MidtransResponseModel({
        required this.message,
        required this.transactionToken,
        required this.transactionUrl,
    });

    factory MidtransResponseModel.fromJson(Map<String, dynamic> json) => MidtransResponseModel(
        message: json["message"],
        transactionToken: json["transaction_token"],
        transactionUrl: json["transaction_url"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "transaction_token": transactionToken,
        "transaction_url": transactionUrl,
    };
}
