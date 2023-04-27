import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomepagePopularAnimeController extends GetxController {
  PagingController<int, GetTopAiringAnimeModel>
      popularAnimePaginationController = PagingController(firstPageKey: 1);

  final RxString animeVideoLink = ''.obs;

  @override
  void onInit() {
    super.onInit();
    popularAnimePaginationController.addPageRequestListener((pageKey) {
      getTopAiringAnime(page: pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    popularAnimePaginationController.dispose();
  }
}
