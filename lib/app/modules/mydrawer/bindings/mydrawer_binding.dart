import 'package:get/get.dart';

import '../controllers/mydrawer_controller.dart';

class MydrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MydrawerController>(
      () => MydrawerController(),
    );
  }
}
