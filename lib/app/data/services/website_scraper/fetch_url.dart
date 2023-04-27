import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

Future<String?> fetchDirectVideoUrl({String episodeLink = ''}) async {
  try {
    final box = GetStorage();

    final response = await http.get(Uri.parse(episodeLink));

    final document = parser.parse(response.body);
    final videoElement =
        document.querySelector('div > div > iframe')!.attributes['src'];

    final replaceVideoLink = videoElement!.replaceFirst('//', 'https://');

    final videoLink = replaceVideoLink;

    box.write('videoLink', videoLink);

    return videoLink;
  } catch (e) {
    showSnackBar('Error', e.toString());
  }
  return '';
}
