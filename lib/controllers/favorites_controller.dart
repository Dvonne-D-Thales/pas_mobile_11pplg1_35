import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class FavoritesController extends GetxController {
  final favorites = <ProductModel>[].obs;
  static const _key = 'favorites';

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw != null && raw.isNotEmpty) {
      try {
        final List<ProductModel> list = productModelFromJson(raw);
        favorites.assignAll(list);
      } catch (_) {
        favorites.clear();
      }
    } else {
      favorites.clear();
    }
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = productModelToJson(favorites.toList());
    await prefs.setString(_key, jsonStr);
  }

  bool isFavorite(ProductModel product) {
    return favorites.any((e) => e.id == product.id);
  }

  Future<void> addFavorite(ProductModel product) async {
    if (!isFavorite(product)) {
      favorites.add(product);
      await saveFavorites();
      Get.snackbar('Saved', '${product.title} added to favorites');
    }
  }

  Future<void> removeFavorite(ProductModel p) async {
    favorites.removeWhere((e) => e.id == p.id);
    await saveFavorites();
    Get.snackbar('Removed', '${p.title} removed from favorites');
  }

  Future<void> toggleFavorite(ProductModel p) async {
    if (isFavorite(p)) {
      await removeFavorite(p);
    } else {
      await addFavorite(p);
    }
  }
}
