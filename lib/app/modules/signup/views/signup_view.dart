import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constans.dart';
import '../../../controllers/auth_controller.dart';

import '../../widgets/custom_button.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  // const SignupView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  final namaC = TextEditingController();
  final alamatC = TextEditingController();
  final noHpC = TextEditingController();
  final emailC = TextEditingController();
  final pwdInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          key: formKey,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/image fisika.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Buat akunmu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: kSubtitle,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: namaC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nama',
                          hintText: 'Masukkan Nama Anda'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autocorrect: false,
                      controller: controller.emailC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Masukkan Email Anda'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: alamatC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Alamat',
                          hintText: 'Masukkan Alamat Anda'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        autocorrect: false,
                        obscureText: controller.isPasswordVisible.value,
                        controller: controller.passC,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Masukkan Email Anda',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.togglePasswordVisibility();
                            },
                            child: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () => authC.signup(
                        controller.emailC.text,
                        controller.passC.text,
                        namaC.text,
                        alamatC.text,
                      ),
                      label: "Daftar",
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
            )
          ],
        ),
      ),
    );
  }
}
