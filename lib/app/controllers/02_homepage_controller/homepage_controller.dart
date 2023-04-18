import 'package:anime_xperience/app/data/services/api/get_recent_episodes.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  final currentIndex = 0.obs;

  void onTabScreenChange(int index) {
    currentIndex.value = index;
    if (index == 0) {
      getRecentEpisodes();
      getTopAiringAnime();
    }
    update();
  }
}
