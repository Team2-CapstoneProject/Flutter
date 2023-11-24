import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/profile_request_model.dart';
import 'package:capstone_project_villa/data/models/response/profile_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ProfileDataSource {
  Future<Either<String, ProfileResponseModel>> getProfile() async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/mobile/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Right(ProfileResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch user data');
    }
  }

  Future<Either<String, ProfileResponseModel>> updateProfile(
      ProfileRequestModel profileRequestModel) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/mobile/updateprofile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: profileRequestModel.toJson(),
    );

    print(response);

    if (response.statusCode == 201) {
      return Right(ProfileResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed update');
    }
  }
}
