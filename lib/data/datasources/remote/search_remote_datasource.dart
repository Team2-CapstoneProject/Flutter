// import 'package:capstone_project_villa/common/constants.dart';
// import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
// import 'package:capstone_project_villa/data/models/response/detail_response_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;

// class DetailDataSource {
//   Future<Either<String, DetailResponModel>> getDetail(String name) async {
//     final token = await AuthLocalDataSource().getToken();
//     final response = await http.get(
//       Uri.parse('$baseUrl/mobile/search?searchText=$name'),
//       headers: {'Authorization': 'Bearer $token'},
//     );
//   }
// }
