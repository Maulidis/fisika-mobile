import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/Video/bindings/video_binding.dart';
import '../modules/Video/views/video_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/data_home/bindings/data_home_binding.dart';
import '../modules/data_home/views/data_home_view.dart';
import '../modules/detail_bab/bindings/detail_bab_binding.dart';
import '../modules/detail_bab/views/detail_bab_view.dart';
import '../modules/favorit/bindings/favorit_binding.dart';
import '../modules/favorit/views/favorit_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lab_virtual/bindings/lab_virtual_binding.dart';
import '../modules/lab_virtual/views/lab_virtual_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mydrawer/bindings/mydrawer_binding.dart';
import '../modules/mydrawer/views/mydrawer_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/quiz_fisika/bindings/quiz_fisika_binding.dart';
import '../modules/quiz_fisika/views/quiz_fisika_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/riwayat_quiz/bindings/riwayat_quiz_binding.dart';
import '../modules/riwayat_quiz/views/riwayat_quiz_view.dart';
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
      page: () => DetailBabView(
        databab: null,
      ),
      binding: DetailBabBinding(),
    ),
    GetPage(
      name: _Paths.DATA_HOME,
      page: () => DataHomeView(),
      binding: DataHomeBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(
        videoUrl: '',
      ),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.FAVORIT,
      page: () => const FavoritView(
        uid: '',
      ),
      binding: FavoritBinding(),
    ),
    GetPage(
      name: _Paths.LAB_VIRTUAL,
      page: () => LabVirtualView(),
      binding: LabVirtualBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_FISIKA,
      page: () => QuizFisikaView(),
      binding: QuizFisikaBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.MYDRAWER,
      page: () {
        final GlobalKey<ScaffoldState> _scaffoldKey =
            GlobalKey<ScaffoldState>();
        return MydrawerView(scaffoldKey: _scaffoldKey);
      },
      binding: MydrawerBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_QUIZ,
      page: () => const RiwayatQuizView(),
      binding: RiwayatQuizBinding(),
    ),
  ];
}
