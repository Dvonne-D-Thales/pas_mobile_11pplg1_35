import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg1_35/Routes/routes.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var photoUrl = ''.obs; // bisa diisi placeholder

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('user_username') ?? '';
    email.value = prefs.getString('user_email') ??
        (username.value.isNotEmpty ? '${username.value}@example.com' : '');
    // placeholder avatar (bisa ganti)
    photoUrl.value = 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(username.value)}';
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_username');
    await prefs.remove('user_email');
    Get.offAllNamed(Routes.login);
  }
}
