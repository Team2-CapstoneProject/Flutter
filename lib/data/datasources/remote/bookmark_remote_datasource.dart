import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/bookmark_request_model.dart';
import 'package:capstone_project_villa/data/models/response/bookmark_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class BookmarkDataSource {
  Future<Either<String, BookmarkResponModel>> getBookmark() async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/mobile/bookmark'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Right(BookmarkResponModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch bookmark');
    }
  }

  Future<Either<String, BookmarkResponModel>> doBookmark(
      BookmarkRequestModel bookmarkRequestModel) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/mobile/dobookmark'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: bookmarkRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(BookmarkResponModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch bookmark');
    }
  }

  Future<Either<String, BookmarkResponModel>> undobookmark(
      BookmarkRequestModel bookmarkRequestModel) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/mobile/undobookmark'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: bookmarkRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(BookmarkResponModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Failed to fetch bookmark');
    }
  }
}
