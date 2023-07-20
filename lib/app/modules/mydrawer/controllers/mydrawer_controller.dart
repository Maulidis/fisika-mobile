
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MydrawerController extends GetxController {
 
  Stream<DocumentSnapshot<Map<String, dynamic>>?>
      fetchSiswaDataFromFirestore() {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email;

    if (email != null) {
      final query = FirebaseFirestore.instance
          .collection('siswa')
          .where('email', isEqualTo: email)
          .limit(1);

      return query.snapshots().map((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.first;
        } else {
          print('Data siswa tidak ditemukan');
          return null;
        }
      });
    } else {
      print('Email pengguna tidak tersedia');
      return Stream.value(null);
    }
  }
}
