import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: "Berhasil",
            middleText:
                "Kami telah mengirimkan reset password ke email $email.",
            onConfirm: () {
              Get.back(); // close dialog
              Get.back(); // go to login
            },
            textConfirm: "Ya, Aku mengerti.");
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid.",
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verification Email",
          middleText:
              "Kamu perlu verifikasi email terlebih dahulu. Apakah kamu ingin dikirimkan verifikasi ulang ?",
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Kirim Ulang",
          textCancel: "Kembali",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Tidak ada pengguna yang ditemukan untuk email itu.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'Tidak ada pengguna yang ditemukan untuk email itu.',
        );
      } else if (e.code == 'wrong-password') {
        print('Kata sandi yang diberikan salah untuk pengguna tersebut.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText:
              'Kata sandi yang diberikan salah untuk pengguna tersebut.',
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: 'Tidak dapat login dengan akun ini.',
      );
    }
  }

  void signup(
      String email, String password, String namaC, String alamatC) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verifikasi Email",
        middleText: "Kami telah mengirikan email verifikasi ke $email.",
        onConfirm: () {
          Get.back(); // close dialog
          Get.back(); // go to login
        },
        textConfirm: "Ya, Saya akan cek email.",
      );

      // Mengambil instance Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Mengambil referensi koleksi "siswa"
      CollectionReference siswaCollection = firestore.collection('siswa');

      // Membuat dokumen baru dengan ID yang dihasilkan otomatis oleh Firestore
      DocumentReference newSiswaDoc = siswaCollection.doc();

      // Menyimpan data ke dokumen siswa yang baru dibuat
      await newSiswaDoc.set({
        'nama': namaC,
        'email': email,
        'alamat': alamatC,
      });

      // Data telah berhasil disimpan ke Firestore
      print('Data siswa berhasil disimpan ke Firestore');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('TKata sandi yang diberikan terlalu lemah.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'Kata sandi yang diberikan terlalu lemah.',
        );
      } else if (e.code == 'email-already-in-use') {
        print('Akun sudah ada untuk email tersebut.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'Akun sudah ada untuk email tersebut.',
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: 'Tidak dapat mendaftarkan akun ini.',
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
