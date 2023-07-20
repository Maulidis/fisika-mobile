import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constans.dart';
import '../../detail_bab/controllers/detail_bab_controller.dart';
import '../../detail_bab/views/detail_bab_view.dart';

class FavoritView extends StatefulWidget {
  final String uid;

  const FavoritView({required this.uid, Key? key}) : super(key: key);

  @override
  _FavoritViewState createState() => _FavoritViewState();
}

class _FavoritViewState extends State<FavoritView> {
  final DetailBabController favoritController = Get.put(DetailBabController());
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    favoritController.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBg,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  color: kBg,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Favorit',
                      style: TextStyle(
                        fontSize: 20,
                        color: KColorDark,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    final favoritList = favoritController.favoritList;
                    if (favoritList.isEmpty) {
                      return Center(
                        child: Text(
                          'Belum ada item favorit',
                          style: TextStyle(
                            fontSize: 16,
                            color: KColorDark,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: favoritList.length,
                        itemBuilder: (context, index) {
                          final favoritItem = favoritList[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() =>
                                        DetailBabView(databab: favoritItem));
                                  },
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Image.network(
                                          favoritItem['image'] as String,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 20),
                                        Flexible(
                                          child: Container(
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Bab',
                                                        style: TextStyle(
                                                          color: KColorDark,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              10), // Jarak antara teks
                                                      Text(
                                                        favoritItem['bab']
                                                            as String,
                                                        style: TextStyle(
                                                          color: KColorDark,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    favoritItem['judul']
                                                        as String,
                                                    style: TextStyle(
                                                        color: KColorDark,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Transform.scale(
                                              scale: 0.8,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  favoritController
                                                      .removeFromFavorites(
                                                          favoritItem);
                                                  // Hapus juga dari GetStorage saat item favorit dihapus
                                                  box.remove(favoritItem['id']);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
