import 'package:get/get.dart';
import '../Network/api_service.dart';
import '../Helper/Sharedpreferences.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final ApiService api = ApiService();

  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  var loading = false.obs;

  void loginNow() async {
    loading.value = true;

    try {
      final res = await api.login(
        usernameC.text,
        passwordC.text,
      );

      // simpan token
      await Sharedpreferences.saveToken(res["token"]);

      // simpan username ke SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", usernameC.text);

      Get.snackbar("Success", res["message"]);
      Get.offAllNamed(Routes.product);

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    loading.value = false;
  }
}