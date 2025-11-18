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
        if (controller.isLoading.value) {
          return const LoadingWidget();
        }

        return Column(
          children: [
            // gunakan SizedBox untuk spacing (Padding tanpa child tidak ideal)
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.product.length,
                itemBuilder: (context, index) {
                  final ProductModel product = controller.product[index];
                  final bookmarked = favController.isFavorite(product);
                  return ProductCard(
                    product: product,
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
