import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pas_mobile_11pplg1_35/Routes/pages.dart';
import 'package:pas_mobile_11pplg1_35/Routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.login,
      getPages: AppPages.pages,
    );
  }
}
