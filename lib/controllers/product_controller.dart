import 'package:get/get.dart';
import '../models/product_model.dart'; // changed casing
import '../network/api_service.dart'; // pastikan path sesuai

class ProductController extends GetxController {
  var isLoading = false.obs;
  var product = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isLoading.value = true;
      product.value = await ApiService.getProduct();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}