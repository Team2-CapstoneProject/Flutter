import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/transaction_request_model.dart';
import 'package:capstone_project_villa/data/models/response/transaction_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class TransactionDataSource {
  Future<Either<String, TransactionResponseModel>> getTransaction(
      TransactionRequestModel transaction) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse(
          '$baseUrl/mobile/calculate?vila_id=${transaction.vila_id}&n_night=${transaction.n_night}'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(
          TransactionResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to calculate data');
    }
  }
}
