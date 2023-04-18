import 'package:anime_xperience/app/data/services/api/get_recent_episodes.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    await getTopAiringAnime();
    getRecentEpisodes();
    super.onInit();
  }

  void onTabScreenChange(int index) {
    currentIndex.value = index;
  }
}
