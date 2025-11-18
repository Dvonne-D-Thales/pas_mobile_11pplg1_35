import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg1_35/models/register_model.dart';
import 'package:pas_mobile_11pplg1_35/network/api_service.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void toggleObscure() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> register() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final full_name = fullnameController.text.trim();
    final email = emailController.text.trim();

    if (username.isEmpty || password.isEmpty || full_name.isEmpty || email.isEmpty) {
      Get.snackbar("Error", "Semua field harus diisi!");
      return;
    }

    isLoading.value = true;

    try {
      RegisterModel user = await ApiService.register(
        username,
        password,
        full_name,
        email,
      );

      Get.offAllNamed(Routes.login, arguments: user);

    } catch (e) {
      Get.snackbar("Register Gagal", e.toString());
    }
  }
}