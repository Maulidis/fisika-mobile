import 'package:fisika_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:fisika_mobile_app/app/modules/profil/views/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constans.dart';
import '../../../controllers/auth_controller.dart';
import '../../detail_bab/views/detail_bab_view.dart';
import '../../mydrawer/views/mydrawer_view.dart';
import '../../profil/controllers/profil_controller.dart';

class DataHomeView extends GetView<HomeController> {
  final AuthController authC = Get.find<AuthController>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ProfilController get profileController => Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: kBg,
      drawer: MydrawerView(scaffoldKey: scaffoldKey),
      body: Column(
        children: <Widget>[
          //Isi dari kolum biru
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: kBlue,
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
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState
                              ?.openDrawer(); // Gunakan scaffoldKey untuk membuka drawer
                        },
                        child: SvgPicture.asset(
                          "assets/icons/menu-modern.svg",
                          color: kWhite,
                          width: 34,
                          height: 34,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Tambahkan logika untuk menangani aksi ketika item drawer diklik
                          Get.to(() => ProfilView())!.then((value) {
                            // Aksi yang akan dilakukan setelah kembali dari halaman About
                            if (value == 'back') {
                              Get.back();
                            }
                          });
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                profileController.profilUrl.value.isNotEmpty
                                    ? NetworkImage(
                                            profileController.profilUrl.value)
                                        as ImageProvider<Object>?
                                    : AssetImage(
                                        'assets/images/user.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Bab Berapa Yang \nBelum Kamu Pelajari ?",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: TextFormField(
                      style: const TextStyle(color: kWhite),
                      onChanged: (value) => controller.search(value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: KColorSearch,
                        hintText: "Cari bab ",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          color: Colors.white
                              .withOpacity(0.4), // Mengatur opasitas teks hint
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        prefixIcon: const Opacity(
                          opacity: 0.4, // Mengatur opasitas ikon
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        prefixIconColor: kWhite,
                        suffixIcon: IconButton(
                          icon: const Opacity(
                            opacity: 0.4, // Mengatur opasitas ikon
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                          ),
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
                      fontWeight: FontWeight.w500,
                      color: KColorDark,
                      fontFamily: 'Roboto',
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
                          final deskripsi = data['deskripsi'] as String?;
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailBabView(
                                    databab: data,
                                  ));
                            },
                            child: Container(
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
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailBabView(
                                    databab: data,
                                  ));
                            },
                            child: Container(
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
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    subtitle: Text(
                                      judul ?? '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
