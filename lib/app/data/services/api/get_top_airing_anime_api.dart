import 'dart:convert';

import 'package:anime_xperience/app/controllers/homepage_controller/homepage__popular_anime_controller.dart';
import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<GetTopAiringAnimeModel> getTopAiringAnime(
    {int page = 1, int maxPage = 30}) async {
  final homeController = Get.put(HomepagePopularAnimeController());
  if (page > maxPage) {
    return GetTopAiringAnimeModel();
  }

  try {
    final response = await http.get(
        Uri.parse(
            'https://api.consumet.org/anime/gogoanime/top-airing?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final body = response.body;

      final decode = jsonDecode(body);

      final getTopAiringModel = GetTopAiringAnimeModel.fromJson(decode);

      homeController.popularAnimePaginationController
          .appendPage([getTopAiringModel], page + 2);

      return getTopAiringModel;
    } else {
      showSnackBar('Error', 'Something went wrong');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }

  return GetTopAiringAnimeModel();
}
