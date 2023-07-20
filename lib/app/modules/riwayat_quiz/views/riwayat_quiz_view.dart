import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_quiz_controller.dart';

class RiwayatQuizView extends GetView<RiwayatQuizController> {
  const RiwayatQuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiwayatQuizView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RiwayatQuizView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
