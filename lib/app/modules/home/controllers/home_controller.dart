import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference products = firestore.collection("babfisika");
  //   return products.get();
  // }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("babfisika");
    return products.snapshots();
  }

  //search
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dataList =
      RxList<QueryDocumentSnapshot<Map<String, dynamic>>>([]);
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> filteredList =
      RxList<QueryDocumentSnapshot<Map<String, dynamic>>>([]);
  RxBool isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    FirebaseFirestore.instance.collection('babfisika').snapshots().listen(
        (QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      dataList.value = querySnapshot.docs;
    }, onError: (error) {
      print("Failed to fetch data: $error");
    });
  }

  void search(String query) {
    if (query.isEmpty) {
      isSearching.value = false;
      filteredList.value = [];
    } else {
      isSearching.value = true;
      filteredList.value = dataList.where((doc) {
        final data = doc.data();
        if (data != null) {
          final bab = data['bab'] as String?;
          final judul = data['judul'] as String?;
          return (bab?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
              (judul?.toLowerCase().contains(query.toLowerCase()) ?? false);
        }
        return false;
      }).toList();
    }
  }

  void clearSearch() {
    isSearching.value = false;
    filteredList.value = [];
  }
}
