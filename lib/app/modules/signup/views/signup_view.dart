import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  // const SignupView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
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
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () =>
                  authC.signup(controller.emailC.text, controller.passC.text),
              child: Text("DAFTAR"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun ? "),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("LOGIN"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
