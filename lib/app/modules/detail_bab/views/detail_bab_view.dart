import 'package:fisika_mobile_app/app/constans.dart';
import 'package:fisika_mobile_app/app/modules/Video/views/video_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_bab_controller.dart';

class DetailBabView extends GetWidget<DetailBabController> {
  final dynamic databab;
  final String babId;

  DetailBabView({required this.databab, required this.babId, Key? key})
      : super(key: key);

  // Reactive state untuk mengelola status favorit
  final RxBool isFavorite = RxBool(false);
  DetailBabController get detailBabController => Get.put(DetailBabController());
  @override
  Widget build(BuildContext context) {
    final String image = databab['image'];
    final String judul = databab['judul'];
    final String bab = databab['bab'];
    final String deskripsi = databab['deskripsi'];
    final List<dynamic> videos = databab['videos'];
    final String judulVideo = videos[0]['judul'];

    // Reactive state untuk mengelola visibilitas deskripsi
    final RxBool showFullDescription = RxBool(true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Bab'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kBg,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
                  detailBabController.favoritList.contains(databab)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: detailBabController.favoritList.contains(databab)
                      ? Colors.red
                      : null,
                )),
            onPressed: () {
              if (detailBabController.favoritList.contains(databab)) {
                detailBabController.removeFromFavorites(databab);
                Get.snackbar('Menu Favorit', 'Dihapus dari Favorit');
              } else {
                detailBabController.addToFavorites(databab);
                Get.snackbar('Menu Favorit', 'Disimpan ke Favorit');
              }
            },
          ),
        ],
      ),
      backgroundColor: kBg,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25.0,
          left: 25.0,
          top: 25.0,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.network(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'bab $bab',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      judul,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kSubtitle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      final String truncatedDescription =
                          showFullDescription.value ? deskripsi : deskripsi;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            truncatedDescription,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                            maxLines: showFullDescription.value ? 2 : 7,
                            overflow: TextOverflow.ellipsis,
                          ),
                          GestureDetector(
                            onTap: () {
                              showFullDescription.toggle();
                            },
                            child: Text(
                              showFullDescription.value
                                  ? 'Baca Selengkapnya'
                                  : 'Sembunyikan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Pembelajaran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kSubtitle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  final String judulVideo = video['judul'];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            judulVideo,
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Navigasi ke halaman video saat ListTile diklik
                                Get.to(() =>
                                    VideoView(videoUrl: video['videoUrl']));
                              },
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Tambahkan logika saat item video diklik
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
