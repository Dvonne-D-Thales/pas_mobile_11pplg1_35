import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark; // dipanggil saat bookmark ditekan
  final bool isBookmarked; // status bookmark

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onBookmark,
    this.isBookmarked = false,
  });

  String _formatPrice(num price) {
    // sederhana: tampilkan tanpa pemformatan internasional
    return 'Rp ${price.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Thumbnail: tetap beri lebar tetap tapi jangan ambil terlalu banyak ruang
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      color: Colors.grey.shade200,
                      child:
                          const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Info teks: gunakan Expanded agar mengambil sisa ruang secara fleksibel
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    // Description (bisa memanjang tapi dibatasi)
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 8),
                    // Kategori + Harga: pakai Wrap agar tidak menyebabkan overflow horizontal
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Chip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text(
                            categoryValues.reverse[product.category] ?? '',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          _formatPrice(product.price),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Bookmark button: batasi lebar agar tidak melebihi ruang
              SizedBox(
                width: 44,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  tooltip: isBookmarked ? 'Unbookmark' : 'Bookmark',
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.orange : Colors.grey,
                  ),
                  onPressed: onBookmark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}