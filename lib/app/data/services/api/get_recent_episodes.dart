import 'dart:convert';

import 'package:anime_xperience/app/data/models/get_recent_episodes_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:http/http.dart' as http;

Future<GetRecentEpisodesModel> getRecentEpisodes({int page = 1}) async {
  try {
    final api =
        "https://api.consumet.org/anime/gogoanime/recent-episodes?page=$page";
    final url = Uri.parse(api);

    // make the get request to the api
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // if the response is 200, then the request is successful
      final body = response.body;

      // decode the json response
      final decode = jsonDecode(body);

      // convert the json response to a model
      final getRecentEpisodesModel = GetRecentEpisodesModel.fromJson(decode);

      // return the model
      return getRecentEpisodesModel;
    } else {
      // if the response is not 200, then the request is not successful
      showSnackBar('Error', 'Something went wrong');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }

  return GetRecentEpisodesModel();
}
