import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../controllers/product_controller.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/loading_widget.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // pastikan FavoritesController tersedia: jika belum ter-registrasi, buat instance
    final favController = Get.isRegistered<FavoritesController>()
        ? Get.find<FavoritesController>()
        : Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Produk")),
      body: Obx(() {
        if (controller.loading.value) {
          return const LoadingWidget();
        }

        return Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(12, 12, 12, 6)),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final ProductModel product = controller.productList[index];
                  final bookmarked = favController.isFavorite(product);
                  return ProductCard(
                    product: product,
                    onTap: () => controller.selectProduct(product),
                    isBookmarked: bookmarked,
                    onBookmark: () => favController.toggleFavorite(product),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
