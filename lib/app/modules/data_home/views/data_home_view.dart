import 'package:fisika_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constans.dart';
import '../../../controllers/auth_controller.dart';

class DataHomeView extends GetView<HomeController> {
  final AuthController authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBg,
      body: Column(
        children: <Widget>[
          //Isi dari kolum biru
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 50,
                right: 20,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/menu.svg"),
                      Image.asset("assets/images/user.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Bab Berapa Yang \nBelum Kamu Pelajari",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: TextFormField(
                      onChanged: (value) => controller.search(value),
                      decoration: InputDecoration(
                        hintText: "Cari bab yang ingin di pelajari",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBlueDark),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => controller.clearSearch(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Text video pembelajaran
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: 5,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    'Video Pembelajaran',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kSubtitle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Isi dari materi bab yang di ambil dari firestore
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 0, right: 10, left: 10),
              color: kBg,
              child: Obx(
                () {
                  if (controller.isSearching.value) {
                    if (controller.filteredList.isEmpty) {
                      return const Center(
                        child: Text("Tidak ditemukan hasil"),
                      );
                    } else {
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: controller.filteredList.length,
                        itemBuilder: (context, index) {
                          final doc = controller.filteredList[index];
                          final data = doc.data();
                          final bab = data['bab'] as String?;
                          final image = data['image'] as String?;
                          final judul = data['judul'] as String?;
                          return Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kWhite,
                            ),
                            width: 161,
                            height: 194,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  image ?? '',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                ListTile(
                                  title: Text(
                                    bab ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    judul ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    if (controller.dataList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final sortedDataList = controller.dataList.toList()
                        ..sort((a, b) {
                          final babA = a['bab'] as String?;
                          final babB = b['bab'] as String?;
                          return int.parse(babA!).compareTo(int.parse(babB!));
                        });

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: sortedDataList.length,
                        itemBuilder: (context, index) {
                          final doc = sortedDataList[index];
                          final data = doc.data();
                          final bab = data['bab'] as String?;
                          final image = data['image'] as String?;
                          final judul = data['judul'] as String?;
                          return Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kWhite,
                            ),
                            width: 161,
                            height: 194,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  image ?? '',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                ListTile(
                                  title: Text(
                                    bab ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    judul ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
