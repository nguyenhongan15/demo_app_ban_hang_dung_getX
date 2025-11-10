import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_tile.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cat = Get.parameters['cat'] ?? 'All';
    final products = Get.find<ProductController>().byCategory(cat);

    return Scaffold(
      appBar: AppBar(title: Text('Danh mục: $cat')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (c, i) => ProductTile(product: products[i]),
      ),
    );
  }
}
