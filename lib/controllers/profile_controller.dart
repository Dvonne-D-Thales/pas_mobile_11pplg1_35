import 'dart:math';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var photoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    username.value = prefs.getString('username') ?? "";
    email.value = prefs.getString('email') ?? "";

    // Cek apakah sudah pernah punya avatar
    String? savedAvatar = prefs.getString('avatar_url');

    if (savedAvatar != null && savedAvatar.isNotEmpty) {
      photoUrl.value = savedAvatar;
      return;
    }

    // Generate random avatar sekali saja
    final random = Random().nextInt(1000);

    final avatar = "https://randomuser.me/api/portraits/men/$random.jpg";

    // Simpan foto agar sama setiap login berikutnya
    await prefs.setString('avatar_url', avatar);

    photoUrl.value = avatar;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear(); // hapus semua data login + avatar

    Get.offAllNamed(Routes.login);
  }
}
