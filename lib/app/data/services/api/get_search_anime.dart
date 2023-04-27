import 'dart:convert';

import 'package:anime_xperience/app/data/models/get_search_anime_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:http/http.dart' as http;

Future<GetSearchAnimeModel> getSearchAnime(String animeName) async {
  try {
    final api = "https://api.consumet.org/anime/gogoanime/$animeName";
    final url = Uri.parse(api);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = response.body;

      final decode = jsonDecode(body);

      final getSearchAnimeModel = GetSearchAnimeModel.fromJson(decode);

      return getSearchAnimeModel;
    } else {
      showSnackBar('Error', 'Something went wrong');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }
  return GetSearchAnimeModel();
}
