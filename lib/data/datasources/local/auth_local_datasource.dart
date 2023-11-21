import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  static const String _tokenKey = 'token';

  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_tokenKey);
  }

  Future<bool> isUserLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
