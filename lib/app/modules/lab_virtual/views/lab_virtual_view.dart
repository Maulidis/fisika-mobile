import 'package:fisika_mobile_app/app/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/lab_virtual_controller.dart';

class LabVirtualView extends GetView<LabVirtualController> {
  LabVirtualController get datacontroller => Get.put(LabVirtualController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBg,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  color: kBg,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Lab Virtual',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: datacontroller.waktuList.length,
                  itemBuilder: (context, index) {
                    final waktu = datacontroller.waktuList[index];
                    final topik1 =
                        datacontroller.topikMap1.values.toList()[index];
                    final topik2 =
                        datacontroller.topikMap2.values.toList()[index];
                    final topik3 =
                        datacontroller.topikMap3.values.toList()[index];
                    final topik4 =
                        datacontroller.topikMap4.values.toList()[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kWhite,
                      ),
                      child: ListTile(
                        title: Text(
                          waktu,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'Topik :',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              topik1,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Text(
                              topik2,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Text(
                              topik3,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Text(
                              topik4,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kBlue,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Aksi yang terjadi saat waktu diklik
                                  datacontroller.showEmulator(waktu);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      kBlue, // Warna latar belakang tombol
                                ),
                                child: const Text(
                                  'Ayo Mulai !!',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      color: kWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
