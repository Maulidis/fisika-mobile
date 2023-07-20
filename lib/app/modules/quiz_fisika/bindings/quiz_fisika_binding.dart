import 'package:get/get.dart';

import '../controllers/quiz_fisika_controller.dart';

class QuizFisikaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizFisikaController>(
      () => QuizFisikaController(),
    );
  }
}
