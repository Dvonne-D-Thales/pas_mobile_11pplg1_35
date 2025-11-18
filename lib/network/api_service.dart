import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_35/network/base_url.dart';
import 'package:pas_mobile_11pplg1_35/models/product_model.dart';

class ApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final Uri url = Uri.parse("${BaseURL.login}/latihan/login");

    final response = await http.post(
      url,
      body: {"email": email, "password": password},
    );

    return json.decode(response.body);
  }

   Future<Map<String, dynamic>> register(String email, String password) async {
    final Uri url = Uri.parse("${BaseURL.register}/register-user");

    final response = await http.post(
      url,
      body: {"email": email, "password": password},
    );

    return json.decode(response.body);
  }

  Future<List<ProductModel>> fetchProducts() async {
    final Uri url = Uri.parse("${BaseURL.product}/products");

    final response = await http.get(url);

    final List<dynamic> data = json.decode(response.body);
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
  

}

