import 'package:get/get.dart';
import '../pages/home_page.dart';
import '../pages/cart_page.dart';
import '../pages/profile_page.dart';
import '../pages/product_detail_page.dart';
import '../pages/category_page.dart';

class AppRoutes {
  static const home = '/';
  static const cart = '/cart';
  static const profile = '/profile';
  static const productDetail = '/product';
  static const category = '/category';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: cart, page: () => const CartPage()),
    GetPage(name: profile, page: () => const ProfilePage()),
    GetPage(name: productDetail, page: () => const ProductDetailPage()),
    GetPage(name: category, page: () => const CategoryPage()),
  ];
}
