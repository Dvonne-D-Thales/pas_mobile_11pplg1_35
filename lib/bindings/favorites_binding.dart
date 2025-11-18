import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/controllers/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}
