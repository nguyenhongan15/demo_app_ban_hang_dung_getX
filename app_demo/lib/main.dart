import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/user_controller.dart';

void main() {
  // Dependency injection toàn cục

  Get.put(ProductController());
  Get.put(CartController());
  Get.put(UserController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce GetX Demo',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
