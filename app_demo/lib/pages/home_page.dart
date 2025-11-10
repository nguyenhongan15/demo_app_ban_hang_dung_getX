import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart';
import '../widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Get.toNamed('/profile'),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Get.toNamed('/cart'),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Obx(() => cartController.count == 0
                    ? const SizedBox.shrink()
                    : CircleAvatar(
                        radius: 9,
                        child: Text('${cartController.count}',
                            style: const TextStyle(fontSize: 10)))),
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // categories quick filter
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['All', 'Thời trang', 'Điện tử', 'Phụ kiện'].map((c) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.toNamed('/category', parameters: {'cat': c}),
                    child: Text(c),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Obx(() {
              final products = productController.products;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    ProductTile(product: products[index]),
              );
            }),
          ),
        ],
      ),
    );
  }
}
