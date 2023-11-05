import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/login_request_model.dart';
import 'package:capstone_project_villa/data/models/request/register_request_model.dart';
import 'package:capstone_project_villa/data/models/response/auth_response_model.dart';
import 'package:capstone_project_villa/data/models/response/home_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiDataSource {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: loginRequestModel.toJson(),
    );
    print('CheckLogin: ${response.body}');

    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final String errorMessage = errorResponse['message'];
      return Left(errorMessage);
    } else {
      return const Left('Login Failed');
    }
  }

  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/registeruser'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Registrasi Failed');
    }
  }

  Future<Either<String, HomeResponseModel>> getUser() async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/mobile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(HomeResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch user data');
    }
  }
}
