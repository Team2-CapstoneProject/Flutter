import 'dart:convert';
import 'dart:io';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/forget_password_request_model.dart';
import 'package:capstone_project_villa/data/models/request/login_request_model.dart';
import 'package:capstone_project_villa/data/models/request/register_profile_request_model.dart';
import 'package:capstone_project_villa/data/models/request/register_request_model.dart';
import 'package:capstone_project_villa/data/models/response/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:async/async.dart';

class ApiDataSource {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: loginRequestModel.toJson(),
    );
    // print('CheckLogin: ${response.body}');

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
      headers: {'Content-Type': 'application/json'},
      body: registerRequestModel.toJson(),
    );

    // print(response.body);

    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final String errorMessage = errorResponse['message'];
      return Left(errorMessage);
    } else {
      return Left('Registrasi Failed');
    }
  }

  Future<Either<String, AuthResponseModel>> registerProfile(
    RegisterProfileRequestModel registerProfileRequestModel,
    File? imageFile,
  ) async {
    final token = await AuthLocalDataSource().getToken();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/auth/registeruserprof'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    // Set data profil
    request.fields['fullname'] = registerProfileRequestModel.fullname ?? '';
    request.fields['nickname'] = registerProfileRequestModel.nickname ?? '';
    request.fields['phone_number'] =
        registerProfileRequestModel.phone_number ?? '';

    // Set gambar
    if (imageFile != null) {
      var imageStream =
          http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'image',
        imageStream,
        length,
        filename: path.basename(imageFile.path),
      );
      request.files.add(multipartFile);
    } else {
      // Sertakan gambar default dari assets jika imageFile null
      var defaultImageFile = File('assets/default.png');
      var defaultImageStream =
          http.ByteStream(DelegatingStream.typed(defaultImageFile.openRead()));
      var defaultImageLength = await defaultImageFile.length();

      var defaultMultipartFile = http.MultipartFile(
        'image',
        defaultImageStream,
        defaultImageLength,
        filename: path.basename(defaultImageFile.path),
      );
      request.files.add(defaultMultipartFile);
    }

    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        var responseJson = await response.stream.bytesToString();
        return Right(AuthResponseModel.fromJson(jsonDecode(responseJson)));
      } else {
        return Left('Failed Update Profile');
      }
    } catch (e) {
      print('Error sending request: $e');
      return Left('Error sending request: $e');
    }
  }

  Future<Either<String, AuthResponseModel>> logout() async {
    final token = await AuthLocalDataSource().removeToken();
    final response = await http.post(
      Uri.parse('$baseUrl/auth/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed Logout');
    }
  }

  Future<Either<String, AuthResponseModel>> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/updatepwd'),
      headers: {'Content-Type': 'application/json'},
      body: forgetPasswordRequestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed Update Password');
    }
  }
}
