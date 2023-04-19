import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  RxInt currentPage = 1.obs;

  RxBool isLoading = false.obs;

  RxBool hasNextPage = true.obs;

  RxList animeList = [].obs;

  final scrollController = ScrollController().obs;

  @override
  void onInit() {
    fetchTopAiringAnime();
    scrollController.value.addListener(scrollListener); // Add this line
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.value.removeListener(scrollListener); // Add this line
    scrollController.value.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.value.hasClients) {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        currentPage.value += 1;
        fetchTopAiringAnime(page: currentPage.value);
      }
    } else {}
  }

  Future<void> fetchTopAiringAnime({int page = 1}) async {
    try {
      isLoading.value = true;
      final response = await getTopAiringAnime(page: page);
      if (response.results!.length < 500) hasNextPage.value = false;
      if (page == 1) {
        animeList.clear();
      }
      animeList.addAll(response.results!);
    } finally {
      isLoading.value = false;
    }
  }
}
