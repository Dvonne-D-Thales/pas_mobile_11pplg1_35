import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../widgets/navbar.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});

  final NavController navC = Get.find<NavController>(); // gunakan controller yg sama

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => navC.currentPage), 
      bottomNavigationBar: const Navbar(),
    );
  }
}
