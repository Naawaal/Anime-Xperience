import 'package:anime_xperience/app/data/models/get_search_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_search_anime.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchTextEditingController = TextEditingController().obs;

  RxList<GetSearchAnimeModel> searchAnimeList = <GetSearchAnimeModel>[].obs;

  @override
  void onClose() {
    super.onClose();
    searchTextEditingController.value.clear();
  }

  @override
  void dispose() {
    super.dispose();
    searchTextEditingController.value.clear();
  }

  Future<void> onSearchSumbit(String animeName) async {
    try {
      searchAnimeList.clear();
      final animeModel = await getSearchAnime(animeName);
      searchAnimeList.add(animeModel);
    } catch (e) {
      showSnackBar('Error', e.toString());
    }
  }
}
