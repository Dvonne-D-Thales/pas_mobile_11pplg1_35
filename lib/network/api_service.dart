import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_35/models/login_model.dart';
import 'package:pas_mobile_11pplg1_35/models/register_model.dart';
import 'package:pas_mobile_11pplg1_35/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://mediadwi.com/api/latihan';
  static const String productUrl = 'https://fakestoreapi.com';

  static Future<RegisterModel> register(
      String username,
      String password,
      String fullname,
      String email,
      ) async {
    final url = Uri.parse('$baseUrl/register-user');

    final response = await http.post(url, body: {
      'username': username,
      'password': password,
      'full_name': fullname,
      'email': email,
    });

    print(response.statusCode);
    print(response.body);

    final decoded = jsonDecode(response.body);

    if (decoded['status'] == true) {
      return RegisterModel(
        username: username,
        password: password,
        fullname: fullname,
        email: email,
      );
    } else {
      throw Exception(decoded['message'] ?? "Register gagal.");
    }
  }

  static Future<LoginModel> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });

    print(response.statusCode);
    print(response.body);

    final decoded = jsonDecode(response.body);

    if (decoded['status'] == true) {
      final token = decoded['token'];

      // Simpan token ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      // Return login model
      return LoginModel(
        username: username,
        password: password,
        email: decoded['email'] ?? '',
        token: token,
      );
    } else {
      throw Exception(decoded['message'] ?? "Login gagal.");
    }
  }

  static Future<List<ProductModel>> getProduct() async {
    final url = Uri.parse('$productUrl/products');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal memuat produk");
    }
  }
}