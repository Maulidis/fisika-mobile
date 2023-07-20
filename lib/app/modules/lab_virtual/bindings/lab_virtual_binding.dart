import 'package:get/get.dart';

import '../controllers/lab_virtual_controller.dart';

class LabVirtualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabVirtualController>(
      () => LabVirtualController(),
    );
  }
}
