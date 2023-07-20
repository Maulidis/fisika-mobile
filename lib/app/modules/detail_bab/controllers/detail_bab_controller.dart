import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailBabController extends GetxController {
  final GetStorage _storage = GetStorage();
  final RxList<dynamic> favoritList = RxList<dynamic>([]);

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    final favorites = _storage.read<List<dynamic>>('favorites') ?? [];
    favoritList.assignAll(favorites);
  }

  void addToFavorites(dynamic item) {
    favoritList.add(item);
    _storage.write('favorites', favoritList.toList());
  }

  void removeFromFavorites(dynamic item) {
    favoritList.remove(item);
    _storage.write('favorites', favoritList.toList());
  }

  void saveFavoritesToStorage() {
    _storage.write('favorites', favoritList.toList());
  }

  bool checkFavorite(dynamic item) {
    return favoritList.any((favItem) => favItem['id'] == item['id']);
  }
}
