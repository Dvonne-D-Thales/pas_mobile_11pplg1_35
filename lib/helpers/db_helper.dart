import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class DBHelper {
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static const _keyUserUsername = 'user_username';
  static const _keyUserPassword = 'user_password';
  static const _keyUserFullname = 'user_fullname';
  static const _keyUserEmail = 'user_email';
  static const _keyFavorites = 'favorites';

  Future<void> saveUser({
    required String username,
    required String email,
    required String password,
    required String fullname,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserUsername, username);
    await prefs.setString(_keyUserPassword, password);
    await prefs.setString(_keyUserFullname, fullname);
    await prefs.setString(_keyUserEmail, email);
  }

  Future<Map<String, String>> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(_keyUserUsername) ?? '';
    final email = prefs.getString(_keyUserEmail) ?? '';
    return {'username': username, 'email': email};
  }

  Future<void> saveFavorites(List<ProductModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = productModelToJson(list);
    await prefs.setString(_keyFavorites, jsonStr);
  }

  Future<List<ProductModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyFavorites);
    if (raw == null || raw.isEmpty) return <ProductModel>[];
    try {
      return productModelFromJson(raw);
    } catch (_) {
      return <ProductModel>[];
    }
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserUsername);
    await prefs.remove(_keyUserPassword);
    await prefs.remove(_keyUserEmail);
    await prefs.remove(_keyUserFullname);
  }
}
