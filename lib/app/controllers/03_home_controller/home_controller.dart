import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTopAiringAnime();
  }
}
