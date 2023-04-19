import 'dart:convert';

import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:http/http.dart' as http;

Future<GetTopAiringAnimeModel> getTopAiringAnime(
    {int page = 1, bool isRefresh = false}) async {
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

      return getTopAiringModel;
    } else {
      showSnackBar('Error', 'Something went wrong');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }

  return GetTopAiringAnimeModel();
}
