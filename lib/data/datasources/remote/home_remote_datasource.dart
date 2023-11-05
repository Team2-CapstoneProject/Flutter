import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/response/home_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HomeDataSource {
  Future<Either<String, HomeResponseModel>> getUser() async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/mobile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return Right(HomeResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch user data');
    }
  }
}
