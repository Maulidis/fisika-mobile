import 'package:fisika_mobile_app/app/constans.dart';
import 'package:fisika_mobile_app/app/controllers/auth_controller.dart';
import 'package:fisika_mobile_app/app/modules/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
//  const LoginView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
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
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Masuk ke akun anda',
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
                      autocorrect: false,
                      controller: controller.emailC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Masukkan Email Anda'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      autocorrect: false,
                      controller: controller.passC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'kata kunci',
                          hintText: 'Masukkan kata kunci Anda'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () => authC.login(
                          controller.emailC.text, controller.passC.text),
                      label: "Login",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text.rich(
                      TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color(0xff949494),
                          ),
                          children: [
                            TextSpan(
                              text: 'Belum punya akun?',
                            ),
                            TextSpan(
                                text: ' Daftar ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.SIGNUP);
                                  },
                                style: TextStyle(color: kBlue))
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                        child: Text("Reset Password",
                            style: TextStyle(color: kBlue)),
                      ),
                    ),
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
