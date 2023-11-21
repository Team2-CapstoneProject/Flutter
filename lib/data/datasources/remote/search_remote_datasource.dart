import 'dart:convert';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/search_request_model.dart';
import 'package:capstone_project_villa/data/models/response/search_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class SearchDataSource {
  Future<Either<String, SearchResponseModel>> searchVillas(
    SearchRequestModel searchRequestModel,
  ) async {
    try {
      final token = await AuthLocalDataSource().getToken();
      final response = await http.get(
        Uri.parse(
            '$baseUrl/mobile/search?searchText=${searchRequestModel.searchText}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('API Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse != null &&
            decodedResponse is Map<String, dynamic>) {
          return Right(SearchResponseModel.fromJson(decodedResponse));
        } else {
          return Left('Failed to parse search response. Invalid JSON format.');
        }
      } else {
        return Left(
            'Failed to fetch search data. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      return Left('An error occurred during the search.');
    }
  }
}
