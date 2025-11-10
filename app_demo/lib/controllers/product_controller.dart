import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  // sample data
  final products = <Product>[
    Product(
      id: 'p1',
      name: 'Áo Thun Cotton',
      category: 'Thời trang',
      description: 'Áo thun cotton thoáng mát, nhiều màu.',
      price: 199.0,
      imageUrl:
          'https://product.hstatic.net/200000054310/product/15__5_.jpg_57cf457d259645ffac41130e5430b531.jpg',
    ),
    Product(
      id: 'p2',
      name: 'Tai Nghe Bluetooth',
      category: 'Điện tử',
      description: 'Tai nghe chống ồn, pin 20h.',
      price: 899.0,
      imageUrl: 'https://cf.shopee.vn/file/9c400c988078c3582f2a499a31cf3a8c',
    ),
    Product(
      id: 'p3',
      name: 'Balo Du Lịch',
      category: 'Phụ kiện',
      description: 'Balo chống nước, nhiều ngăn.',
      price: 350.0,
      imageUrl:
          'https://tse1.mm.bing.net/th/id/OIP.PUlhzYed1uXHhkWJnQYwkAHaIZ?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),
    Product(
      id: 'p4',
      name: 'Iphone 17 Pro Max',
      category: 'Điện tử',
      description: 'Hàng thật giá rẻ, camera siêu nét.',
      price: 4999.0,
      imageUrl:
          'https://img.teknolojioku.com/rcman/Cw1280h720q95gc/storage/files/images/2025/09/09/iphone-17-pro-max-ozellikleri-gjou_cover.jpg',
    ),
  ].obs;

  // Lọc theo category
  List<Product> byCategory(String category) {
    if (category == 'All') return products;
    return products.where((p) => p.category == category).toList();
  }

  Product? findById(String id) {
    return products.firstWhereOrNull((p) => p.id == id);
  }
}
