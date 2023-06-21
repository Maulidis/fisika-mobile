import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_bab_controller.dart';

class DetailBabView extends GetView<DetailBabController> {
  const DetailBabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailBabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
