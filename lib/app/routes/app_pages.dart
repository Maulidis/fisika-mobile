import 'package:get/get.dart';

import '../modules/data_home/bindings/data_home_binding.dart';
import '../modules/data_home/views/data_home_view.dart';
import '../modules/detail_bab/bindings/detail_bab_binding.dart';
import '../modules/detail_bab/views/detail_bab_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BAB,
      page: () => const DetailBabView(),
      binding: DetailBabBinding(),
    ),
    GetPage(
      name: _Paths.DATA_HOME,
      page: () => DataHomeView(),
      binding: DataHomeBinding(),
    ),
  ];
}
