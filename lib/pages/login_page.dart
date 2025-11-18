import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';
import '../widgets/costum_button.dart';
import '../widgets/costum_textfield.dart';
import '../Controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo / Icon
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue.shade200,
                  child: const Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),

                // Judul
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to continue",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 30),

                // Username
                CustomTextField(
                  label: "Username",
                  controller: controller.usernameC,
                ),
                const SizedBox(height: 15),

                // Password
                CustomTextField(
                  label: "Password",
                  controller: controller.passwordC,
                  obscure: true,
                ),
                const SizedBox(height: 25),

                // Tombol login
                Obx(() {
                  return CustomButton(
                    text: "Login",
                    onPressed: controller.loginNow,
                    loading: controller.loading.value,
                  );
                }),

                const SizedBox(height: 20),

                // Footer text
                TextButton(
                  onPressed: () {
                   Get.offAllNamed(Routes.register);
                  },
                  child: const Text(
                    "Don't have an account? Register",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}