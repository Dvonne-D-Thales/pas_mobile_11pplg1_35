import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/controllers/product_controller.dart';
import 'package:pas_mobile_11pplg1_35/controllers/favorites_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<FavoritesController>(() => FavoritesController()); // added so favorites available on product route
  }
}
