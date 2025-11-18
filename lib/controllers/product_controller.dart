import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart'; // changed casing
import '../network/api_service.dart'; // pastikan path sesuai

class ProductController extends GetxController {
  var loading = true.obs;
  var productList = <ProductModel>[].obs;

  final api = ApiService(); // definisikan API service

  @override
  void onInit() {
    super.onInit();
    loadGames(); // otomatis load saat controller dibuat
  }

  // READ data dari API
  void loadGames() async {
    try {
      loading.value = true;
      final data = await api.fetchProducts(); // panggil API
      productList.value = data.cast<ProductModel>();
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat data: $e");
    } finally {
      loading.value = false;
    }
  }

  // handle klik game
  void selectProduct(ProductModel product) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    Get.snackbar(
      "Game dipilih",
      product.title,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Get.theme.primaryColor,
      colorText: Get.theme.colorScheme.onPrimary,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
    );
  }
}