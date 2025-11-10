import 'package:get/get.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  var user =
      UserModel(id: 'u1', name: 'Người Dùng', email: 'user@example.com').obs;

  void updateName(String name) {
    user.update((val) {
      if (val != null) val.name = name;
    });
  }

  void updateEmail(String email) {
    user.update((val) {
      if (val != null) val.email = email;
    });
  }
}
