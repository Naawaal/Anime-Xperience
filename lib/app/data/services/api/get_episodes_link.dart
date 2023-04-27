import 'dart:convert';

import 'package:anime_xperience/app/data/models/get_anime_episodes_url_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

Future<GetAnimeEpisodesUrlModel> getAnimeEpisodesLink() async {
  final box = GetStorage();

  final episodesID = box.read('episodesID');

  String api = "https://api.consumet.org/anime/gogoanime/watch/$episodesID";

  final url = Uri.parse(api);
  final response = await http.get(url);

  try {
    if (response.statusCode == 200) {
      final body = response.body;
      final decode = jsonDecode(body);
      final data = GetAnimeEpisodesUrlModel.fromJson(decode);

      final box = GetStorage();

      box.write('episodes', data.sources![0].url.toString());
      print("episodes id: $episodesID");
      print("model: ${data.sources![0].url.toString()}");
      print("box: ${box.read('episodes')}");
      return data;
    } else {
      showSnackBar('Error', 'Unable to play video from server');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }
  return GetAnimeEpisodesUrlModel();
}
