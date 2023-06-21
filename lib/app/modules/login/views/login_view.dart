import 'package:fisika_mobile_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
//  const LoginView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              autocorrect: false,
              controller: controller.passC,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                child: Text("Reset Password"),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  authC.login(controller.emailC.text, controller.passC.text),
              child: Text("LOGIN"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun ? "),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("DAFTAR SEKARANG"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
