import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataHomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference products = firestore.collection("babfisika");
  //   return products.get();
  // }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("babfisika");
    return products.snapshots();
  }
}
