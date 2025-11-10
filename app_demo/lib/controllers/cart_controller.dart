import "package:get/get.dart";
import '../models/product_model.dart';

class CartController extends GetxController {
  var items = <Product>[].obs;

  void add(Product p) {
    items.add(p);
    Get.snackbar('Thêm vào giỏ', '${p.name} đã được thêm',
        snackPosition: SnackPosition.BOTTOM);
  }

  void remove(Product p) {
    items.remove(p);
  }

  double get total => items.fold(0, (sum, item) => sum + item.price);

  int get count => items.length;
}
