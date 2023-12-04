import 'dart:convert';
import 'dart:io';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/profile_request_model.dart';
import 'package:capstone_project_villa/data/models/response/profile_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

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
    ProfileRequestModel profileRequestModel,
    File? imageFile,
  ) async {
    final token = await AuthLocalDataSource().getToken();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/auth/registeruserprof'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['fullname'] = profileRequestModel.fullname!;
    request.fields['nickname'] = profileRequestModel.nickname!;
    request.fields['phone_number'] = profileRequestModel.phone_number!;

    if (imageFile != null && imageFile.path.startsWith('/data/')) {
      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'image',
        imageStream,
        length,
        filename: path.basename(imageFile.path),
      );
      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        var responseJson = await response.stream.bytesToString();
        return Right(ProfileResponseModel.fromJson(jsonDecode(responseJson)));
      } else {
        return Left('Failed Update Profile');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
