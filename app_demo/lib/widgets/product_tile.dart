import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../controllers/cart_controller.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find();
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl,
            width: 60, height: 60, fit: BoxFit.cover),
        title: Text(product.name),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        onTap: () {
          Get.toNamed('/product', parameters: {'id': product.id});
        },
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () => cart.add(product),
        ),
      ),
    );
  }
}
