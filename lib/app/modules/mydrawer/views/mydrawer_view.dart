import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisika_mobile_app/app/modules/about/views/about_view.dart';
import 'package:fisika_mobile_app/app/modules/profil/views/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../profil/controllers/profil_controller.dart';

class MydrawerView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final AuthController authC = Get.find<AuthController>();
  ProfilController get controller => Get.put(ProfilController());

  MydrawerView({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>?>(
              future: controller.fetchSiswaDataFromFirestore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Tampilkan indikator loading saat data sedang diambil
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return Text(
                      'Data tidak tersedia'); // Tampilkan teks jika data tidak tersedia
                }

                final data = snapshot.data!.data();
                final namaSiswa = data?['nama'] ?? 'Nama Siswa';
                final emailSiswa = data?['email'] ?? 'Email Siswa';
                final profil = data?['profil'] as String?;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => CircleAvatar(
                          radius: 30,
                          backgroundImage: controller.profilUrl.value.isNotEmpty
                              ? NetworkImage(controller.profilUrl.value)
                                  as ImageProvider<Object>?
                              : AssetImage('assets/images/user.png'),
                        )),
                    SizedBox(height: 8),
                    Text(
                      namaSiswa,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      emailSiswa,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profil'),
              onTap: () {
                // Tambahkan logika untuk menangani aksi ketika item drawer diklik
                Get.to(() => ProfilView())!.then((value) {
                  // Aksi yang akan dilakukan setelah kembali dari halaman About
                  if (value == 'back') {
                    Get.back();
                  }
                });
              }),
          ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Tambahkan logika untuk menangani aksi ketika item drawer diklik
                Get.to(() => AboutView())!.then((value) {
                  // Aksi yang akan dilakukan setelah kembali dari halaman About
                  if (value == 'back') {
                    Get.back();
                  }
                });
              }),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            onTap: () => authC.logout(),
          ),
        ],
      ),
    );
  }
}
