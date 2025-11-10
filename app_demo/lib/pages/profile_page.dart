import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userCtrl = Get.find();
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final user = userCtrl.user.value;
          nameCtrl.text = user.name;
          emailCtrl.text = user.email;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${user.id}'),
              const SizedBox(height: 10),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Tên'),
              ),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  userCtrl.updateName(nameCtrl.text);
                  userCtrl.updateEmail(emailCtrl.text);
                  Get.snackbar('Đã lưu', 'Thông tin người dùng đã cập nhật',
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text('Lưu'),
              )
            ],
          );
        }),
      ),
    );
  }
}
