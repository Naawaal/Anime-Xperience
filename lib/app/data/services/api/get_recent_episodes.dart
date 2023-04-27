import 'dart:convert';

import 'package:anime_xperience/app/controllers/homepage_controller/homepage_recent_episodes_controller.dart';
import 'package:anime_xperience/app/data/models/get_recent_episodes_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<GetRecentEpisodesModel> getRecentEpisodes(
    {int page = 1, int maxPage = 20}) async {
  final homeController = Get.put(HomepageRecentEpisodesController());

  if (page > maxPage) {
    return GetRecentEpisodesModel();
  }

  try {
    final api =
        "https://api.consumet.org/anime/gogoanime/recent-episodes?page=$page";
    final url = Uri.parse(api);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = response.body;

      final decode = jsonDecode(body);

      final getRecentEpisodesModel = GetRecentEpisodesModel.fromJson(decode);

      homeController.recentEpisodesPaginationController
          .appendPage([getRecentEpisodesModel], page + 1);

      return getRecentEpisodesModel;
    } else {
      showSnackBar('Error', 'Something went wrong');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
    homeController.recentEpisodesPaginationController.error = e;
  }
  return GetRecentEpisodesModel();
}
