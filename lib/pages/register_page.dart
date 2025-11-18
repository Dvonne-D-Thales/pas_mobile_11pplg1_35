import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';
import 'package:pas_mobile_11pplg1_35/widgets/costum_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
         Get.offAllNamed(Routes.login);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 240, 250),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    label: "Username",
                    controller: registerController.usernameController,
                    obscure: false,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => CustomTextField(
                      label: "Password",
                      controller: registerController.passwordController,
                      obscure: registerController.obscurePassword.value,
                      suffixIcon: registerController.obscurePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onSuffixTap: registerController.togglePasswordVisibility,
                    ),
                  ),
                  const SizedBox(height: 20),
                   CustomTextField(
                    label: "Email",
                    controller: registerController.emailController,
                    obscure: false,
                  ),
                  const SizedBox(height: 20),
                   CustomTextField(
                    label: "Full Name",
                    controller: registerController.fullnameController,
                    obscure: false,
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Center(
                      child: Obx(
                        () => registerController.isLoading.value
                            ? const SizedBox(
                                height: 48,
                                child: Center(child: CircularProgressIndicator()),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(48),
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  registerController.register();
                                },
                                child: const Text('Register'),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
