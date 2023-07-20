import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../constans.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
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
                      'About',
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
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kursus Online Fisika',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'Roboto',
                              color: KColorDark,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Deskripsi Aplikasi:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              color: KColorDark,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Aplikasi Kursus Online Fisika adalah platform belajar daring yang dirancang untuk membantu siswa memahami konsep-konsep fisika secara interaktif. Aplikasi ini menyediakan modul pembelajaran yang komprehensif, video tutorial berkualitas dan latihan soal.',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: KGrey,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Tim Pengembang:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              color: KColorDark,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Maulidis rezeki',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: KGrey,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Kontak dan Dukungan:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              color: KColorDark,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Email: info@kursusfisika.com',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: KGrey,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Text(
                            'Telepon: +123456789',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: KGrey,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
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
