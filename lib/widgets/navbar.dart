import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';

class Navbar extends GetView<NavController> {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits_rounded),
              label: "Product List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorited",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ));
  }
}
