import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pid = Get.parameters['id'] ?? '';
    final product = Get.find<ProductController>().findById(pid);
    final cart = Get.find<CartController>();

    if (product == null) {
      return Scaffold(
          appBar: AppBar(title: const Text('Sản phẩm')),
          body: const Center(child: Text('Không tìm thấy sản phẩm')));
    }

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 180),
            const SizedBox(height: 12),
            Text(product.description),
            const SizedBox(height: 12),
            Text('\$${product.price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                cart.add(product);
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Thêm vào giỏ'),
            ),
          ],
        ),
      ),
    );
  }
}
