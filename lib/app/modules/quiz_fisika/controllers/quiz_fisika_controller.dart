import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuizFisikaController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("question-quiz");
    return products.snapshots();
  }
}
