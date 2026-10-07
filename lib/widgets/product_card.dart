import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCart;

  const ProductCard({Key? key, required this.product, required this.onFavoriteToggle, required this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover, width: double.infinity)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${product.price}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red), onPressed: onFavoriteToggle),
                    IconButton(icon: const Icon(Icons.add_shopping_cart), onPressed: onAddToCart),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
