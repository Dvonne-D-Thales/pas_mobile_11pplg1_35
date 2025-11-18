import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences {
  static const _keyToken = "token";

  static Future saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  static Future clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
