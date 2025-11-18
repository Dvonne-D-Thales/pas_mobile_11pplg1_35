import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Routes/routes.dart'; // relative import to match project
import '../controllers/product_controller.dart';
import '../pages/product_page.dart';
import '../controllers/favorites_controller.dart';
import '../pages/favorites_page.dart';
import '../controllers/profile_controller.dart';
import '../pages/profile_page.dart';



class NavController extends GetxController {
  var selectedIndex = 0.obs;
  late final List<Widget> pages;

  @override
  void onInit() {
    super.onInit();

     Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
     Get.lazyPut<ProfileController>(() => ProfileController());
    pages = [
       ProductPage(),
       FavoritesPage(),
       ProfilePage(),
    ];
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  Widget get currentPage => pages[selectedIndex.value];

  void logout() {
    Get.offAllNamed(Routes.login);
  }
}
