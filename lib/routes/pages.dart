import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg1_35/Routes/routes.dart';
import 'package:pas_mobile_11pplg1_35/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg1_35/bindings/nav_binding.dart';
import 'package:pas_mobile_11pplg1_35/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg1_35/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_35/pages/mainmenu_page.dart';
import 'package:pas_mobile_11pplg1_35/pages/product_page.dart';
import 'package:pas_mobile_11pplg1_35/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_35/pages/favorites_page.dart';
import 'package:pas_mobile_11pplg1_35/bindings/favorites_binding.dart';
import 'package:pas_mobile_11pplg1_35/pages/profile_page.dart';
import 'package:pas_mobile_11pplg1_35/bindings/profile_binding.dart';
import 'package:pas_mobile_11pplg1_35/bindings/product_binding.dart'; // added

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.mainmenu,
      page: () => MainMenu(),
      binding: NavBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBinding(), // fixed binding
    ),
    GetPage(
      name: Routes.favorites,
      page: () => const FavoritesPage(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
