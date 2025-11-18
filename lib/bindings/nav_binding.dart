import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/controllers/nav_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
  }
}
