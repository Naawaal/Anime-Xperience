import 'package:anime_xperience/app/data/models/get_recent_episodes_model.dart';
import 'package:anime_xperience/app/data/services/api/get_recent_episodes.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomepageRecentEpisodesController extends GetxController {
  PagingController<int, GetRecentEpisodesModel>
      recentEpisodesPaginationController = PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    recentEpisodesPaginationController.addPageRequestListener((pageKey) {
      getRecentEpisodes(page: pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    recentEpisodesPaginationController.dispose();
  }
}
