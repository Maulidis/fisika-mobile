import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isPasswordVisible = false.obs;
  var passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }



  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
