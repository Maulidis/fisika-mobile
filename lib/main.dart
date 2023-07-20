import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fisika_mobile_app/app/constans.dart';
import 'package:fisika_mobile_app/app/controllers/auth_controller.dart';
import 'package:fisika_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/home/views/home_view.dart';
import 'app/modules/login/controllers/login_controller.dart';
import 'app/modules/login/views/login_view.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

// versi tidak ada splash screen

// class MyApp extends StatelessWidget {
//   final authC = Get.put(AuthController(), permanent: true);
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: authC.streamAuthStatus,
//       builder: (context, snapshot) {
//         print(snapshot.data);
//         if (snapshot.connectionState == ConnectionState.active) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: "Application",
//             initialRoute:
//                 snapshot.data != null && snapshot.data!.emailVerified == true
//                     ? Routes.HOME
//                     : Routes.LOGIN,
//             getPages: AppPages.routes,
//             // home: snapshot.data != null ? HomeView() : LoginView(),
//           );
//         }
//         return LoadingView();
//       },
//     );
//   }
// }

// versi ada splash screen

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  final loginC = Get.put(LoginController(), permanent: true);
  final homeC = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      getPages: AppPages.routes,
      home: AnimatedSplashScreen(
        splash: 'assets/images/image screen.png',
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kBlue, // Warna latar belakang splash screen
        duration: 3000, // Durasi animasi splash screen (dalam milidetik)
        nextScreen: StreamBuilder<User?>(
          stream: authC.streamAuthStatus,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.active) {
              return snapshot.data != null &&
                      snapshot.data!.emailVerified == true
                  ? HomeView()
                  : LoginView();
            }
            return LoadingView();
          },
        ),
      ),
    );
  }
}
