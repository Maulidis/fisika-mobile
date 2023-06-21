import 'package:get/get.dart';

import '../controllers/data_home_controller.dart';

class DataHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataHomeController>(
      () => DataHomeController(),
    );
  }
}
