import 'dart:convert';

import 'package:anime_xperience/app/data/models/get_anime_details_model.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:http/http.dart' as http;

Future<GetAnimeDetailsModel> getAnimeDetails(String animeName) async {
  String api = "https://api.consumet.org/anime/gogoanime/info/$animeName";

  final url = Uri.parse(api);
  final response = await http.get(url);

  try {
    if (response.statusCode == 200) {
      final body = response.body;
      final decode = jsonDecode(body);
      final data = GetAnimeDetailsModel.fromJson(decode);

      return data;
    } else {
      showSnackBar('Error', 'Unable to fetch data from server');
    }
  } catch (e) {
    showSnackBar('Error', e.toString());
  }
  return GetAnimeDetailsModel();
}
