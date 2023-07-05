import 'package:fisika_mobile_app/app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';
import '../../data_home/views/data_home_view.dart';
import '../controllers/home_controller.dart';
import 'bottom_navigation_bar.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: DataHomeView(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
