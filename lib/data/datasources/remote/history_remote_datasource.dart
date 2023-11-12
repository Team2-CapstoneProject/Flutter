import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/response/history_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HistoryDataSource {
  Future<Either<String, HistoryResponseModel>> getHistory() async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/mobile/history'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Right(HistoryResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch history');
    }
  }
}