import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';
import 'package:flutter/material.dart';
import '../Network/api_service.dart';
import 'package:pas_mobile_11pplg1_35/models/login_model.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void toggleObscure() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Semua field harus diisi!");
      return;
    }

    isLoading.value = true;

    try {
      // Login ke API
      LoginModel user = await ApiService.login(username, password);

      final prefs = await SharedPreferences.getInstance();

      // Simpan token
      await prefs.setString('token', user.token);

      // Simpan username (yang diketik)
      await prefs.setString('username', username);

      // Email dari API (jika tidak ada, pakai default)
      await prefs.setString(
        'email',
        user.email,
      );

      // Pindah ke main menu
      Get.offAllNamed(Routes.mainmenu);

    } catch (e) {
      Get.snackbar("Login Gagal", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('email');

    Get.offAllNamed(Routes.login);
  }
}
