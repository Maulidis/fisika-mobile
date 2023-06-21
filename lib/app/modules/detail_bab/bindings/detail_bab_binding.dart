import 'package:get/get.dart';

import '../controllers/detail_bab_controller.dart';

class DetailBabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBabController>(
      () => DetailBabController(),
    );
  }
}
