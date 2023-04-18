import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  @override
  void onInit() async {
    await getTopAiringAnime();
    super.onInit();
  }
}
