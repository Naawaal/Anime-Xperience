import 'dart:convert';

import 'package:anime_xperience/app/data/models/get_anime_episodes_url_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

Future<GetAnimeEpisodesUrlModel> getAnimeEpisodesLink(String episodesID) async {
  final box = GetStorage();
  String api = "https://api.consumet.org/anime/gogoanime/watch/$episodesID";

  final url = Uri.parse(api);
  final response = await http.get(url);

  try {
    if (response.statusCode == 200) {
      final body = response.body;
      final decode = jsonDecode(body);
      final data = GetAnimeEpisodesUrlModel.fromJson(decode);
      print(data.sources![0].url);
      box.write('720p', data.sources![0].url);
      return data;
    } else {
      showSnackBar('Error', 'Unable to play video from server');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }
  return GetAnimeEpisodesUrlModel();
}
