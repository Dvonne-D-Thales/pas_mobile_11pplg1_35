import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          return const Center(child: Text('No favorites yet'));
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
