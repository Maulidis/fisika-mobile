import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailBabController extends GetxController {
  // // Reactive state untuk menyimpan daftar favorit
  final RxList<dynamic> favoritList = RxList<dynamic>([]);

  final CollectionReference favoritCollection =
      FirebaseFirestore.instance.collection('favorit');

  // Method untuk menambahkan item ke daftar favorit
  void addToFavorites(dynamic item) {
    favoritList.add(item);
  }

  // Method untuk menghapus item dari daftar favorit
  void removeFromFavorites(dynamic item) {
    favoritList.remove(item);
  }
}
