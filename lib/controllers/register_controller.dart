import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_35/helpers/db_helper.dart';

class RegisterController extends GetxController {
  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();

  // State
  var obscurePassword = true.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  bool validateFields() {
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> register() async {
    if (!validateFields()) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    try {
      // Simulate network call or registration logic
      await Future.delayed(const Duration(seconds: 1));

      // Save basic user info via DBHelper
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();
      final fullname = fullnameController.text.trim();
      final email = emailController.text.trim();
      await DBHelper.instance.saveUser(username: username,password: password,fullname: fullname, email: email);

      // On success navigate to LoginPage
      Get.off(() => LoginPage());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Registration failed',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
