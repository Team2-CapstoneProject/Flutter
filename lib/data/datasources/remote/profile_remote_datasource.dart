import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/response/profile_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ProfileDataSource {
  Future<Either<String, ProfileResponseModel>> getProfile() async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse(
        '$baseUrl/mobile/profile',
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Right(ProfileResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch user data');
    }
  }
}
