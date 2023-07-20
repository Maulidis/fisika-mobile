import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../constans.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  ProfilController get profileController => Get.put(ProfilController());

  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 35,
            ),
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    MdiIcons.arrowLeft,
                    color: KColorDark,
                    size: 25.0,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Profil',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        color: KColorDark,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 40.0), // Menambahkan jarak agar ikon tetap di pojok
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 15, right: 30, bottom: 15),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>?>(
                    future: profileController.fetchSiswaDataFromFirestore(),
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
                      final deskripsi =
                          data?['deskripsi'] ?? 'Tambahkan deskripsi ';
                      final profil = data?['profil'] as String?;

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: profileController
                                                            .profilUrl
                                                            .value
                                                            .isNotEmpty
                                                        ? NetworkImage(
                                                                profileController
                                                                    .profilUrl
                                                                    .value)
                                                            as ImageProvider<
                                                                Object>?
                                                        : AssetImage(
                                                            'assets/images/user.png'),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: InkWell(
                                                      onTap: () {
                                                        profileController
                                                            .pickImageAndUpload();
                                                      },
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                        ),
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: Colors.white,
                                                          size: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        namaSiswa,
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            fontFamily: 'Roboto',
                                            color: KColorDark),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Siswa',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto',
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Tentang Saya',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                    color: KColorDark),
                              ),
                              SizedBox(height: 8.0),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Roboto',
                                    color: KColorDark,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: deskripsi,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: KGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Roboto',
                                  color: KColorDark,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Roboto',
                                    color: KGrey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: emailSiswa,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Pelajaran',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Roboto',
                                  color: KColorDark,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  Chip(
                                    label: Text(
                                      'Fisika',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    backgroundColor: Colors.blue,
                                    labelStyle: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
