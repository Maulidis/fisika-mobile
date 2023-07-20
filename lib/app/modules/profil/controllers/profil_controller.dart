import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilController extends GetxController {
  RxString profilUrl = ''.obs;
  RxString namaSiswa = ''.obs;
  RxString emailSiswa = ''.obs;

  @override
  void onInit() {
    fetchSiswaDataFromFirestore();
    super.onInit();
  }

  void updateNamaSiswa(String nama) {
    namaSiswa.value = nama;
  }

  void updateEmailSiswa(String email) {
    emailSiswa.value = email;
  }

  void updateProfilUrl(String url) {
    profilUrl.value = url;
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>?>
      fetchSiswaDataFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email;

    if (email != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('siswa')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        final profil = data['profil'] as String?;
        profilUrl.value = profil ?? '';
        return snapshot.docs.first;
      } else {
        print('Data siswa tidak ditemukan');
      }
    } else {
      print('Email pengguna tidak tersedia');
    }

    return null;
  }

  Future<void> pickImageAndUpload() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final user = FirebaseAuth.instance.currentUser;
      final email = user?.email;

      if (email != null) {
        final storageRef = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('profil/$email.jpg');

        final uploadTask = storageRef.putFile(file);
        final snapshot = await uploadTask.whenComplete(() {});
        final downloadUrl = await snapshot.ref.getDownloadURL();

        final userDocRef = await FirebaseFirestore.instance
            .collection('siswa')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        if (userDocRef.docs.isNotEmpty) {
          // Field profil sudah ada, lakukan update
          await userDocRef.docs.first.reference.update({'profil': downloadUrl});
        } else {
          // Field profil belum ada, buat field baru
          await FirebaseFirestore.instance
              .collection('siswa')
              .add({'email': email, 'profil': downloadUrl});
        }

        profilUrl.value =
            downloadUrl; // Update profilUrl menggunakan RxString set()
        Get.forceAppUpdate(); // Memperbarui tampilan UI secara real-time di ciceravatar
      }
    }
  }
}
