import 'package:anime_xperience/app/controllers/homepage_controller/homepage__popular_anime_controller.dart';
import 'package:anime_xperience/app/controllers/homepage_controller/homepage_controller.dart';
import 'package:anime_xperience/app/controllers/homepage_controller/homepage_recent_episodes_controller.dart';
import 'package:get/get.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController());
    Get.put(HomepageRecentEpisodesController());
    Get.put(HomepagePopularAnimeController());
  }
}
