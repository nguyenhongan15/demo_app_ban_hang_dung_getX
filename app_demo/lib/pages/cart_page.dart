import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Giỏ hàng')),
      body: Obx(() {
        if (cart.items.isEmpty) {
          return const Center(child: Text('Giỏ hàng trống'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (c, i) {
                  final item = cart.items[i];
                  return ListTile(
                    leading: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => cart.remove(item),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Tổng: \$${cart.total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Checkout',
                        content: const Text(
                            'Checkout demo — không có thanh toán thật.'),
                        onConfirm: () {
                          cart.items.clear();
                          Get.back();
                        },
                        onCancel: () {},
                      );
                    },
                    child: const Text('Thanh toán'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
