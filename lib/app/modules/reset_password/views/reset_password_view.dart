import 'package:fisika_mobile_app/app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  // const ResetPasswordView({Key? key}) : super(key: key);
  @override
  final authC = Get.find<AuthController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: KColorDark,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: kWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            MdiIcons.arrowLeft,
            color: KColorDark,
            size: 25.0,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: kWhite,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Password Kamu',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.emailC,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tolong masukkan email kamu';
                }
                // You can add more email validation logic if needed
                return null;
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () => authC.resetPassword(controller.emailC.text),
              label: 'RESET',
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah punya akun ?'),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
