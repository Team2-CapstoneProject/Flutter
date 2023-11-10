import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/response/detail_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class DetailDataSource {
  Future<Either<String, DetailResponModel>> getDetail(int id) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/mobile/vila/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Right(DetailResponModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch details');
    }
  }
}
