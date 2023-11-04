import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/request/login_request_model.dart';
import 'package:capstone_project_villa/data/models/response/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiDataSource {
  // Future<Either<String, UserResponseModel>> register(
  //     RegisterRequestModel registerRequestModel) async {
  //   final response = await http.post(
  //     Uri.parse(
  //       '$baseUrl/auth/registeruser',
  //     ),
  //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //     body: registerRequestModel.toJson(),
  //   );

  //   if (response.statusCode == 201) {
  //     return Right(UserResponseModel.fromJson(jsonDecode(response.body)));
  //   } else {
  //     return Left('Gagal Register');
  //   }
  // }

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
    } else {
      return const Left('Login Gagal');
    }
  }
}
