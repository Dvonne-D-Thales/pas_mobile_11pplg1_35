import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/routes/routes.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/product_card.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bookmark_border, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text('No favorites yet', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                     Get.offAllNamed(Routes.mainmenu);
                    },
                    child: const Text('Lihat Produk'),
                  )
                ],
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final product = controller.favorites[index];
            return ProductCard(
              product: product,
              isBookmarked: true,
              onBookmark: () => controller.toggleFavorite(product),
            );
          },
        );
      }),
    );
  }
}
