import 'package:get/get.dart';

import '../controllers/riwayat_quiz_controller.dart';

class RiwayatQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatQuizController>(
      () => RiwayatQuizController(),
    );
  }
}
