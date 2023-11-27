import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/transaction_request_model.dart';
import 'package:capstone_project_villa/data/models/response/midtrans_response_model.dart';
import 'package:capstone_project_villa/data/models/response/transaction_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class TransactionDataSource {
  Future<Either<String, TransactionResponseModel>> getTransaction(
      TransactionRequestModel transaction) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/mobile/calculate'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: transaction.toJson(),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return Right(
          TransactionResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to calculate data');
    }
  }

  Future<Either<String, MidtransResponseModel>> paymentMidtrans(
      TransactionRequestModel transaction) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/mobile/pg'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: transaction.toJson(),
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(MidtransResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to midtrans data');
    }
  }
}
