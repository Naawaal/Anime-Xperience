import 'package:anime_xperience/app/controllers/homepage_controller/homepage_controller.dart';
import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_anime_details.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:anime_xperience/app/ui/global_widgets/listview_widget.dart';
import 'package:anime_xperience/app/ui/pages/anime_detail_screen/anime_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreenPopularAnime extends StatefulWidget {
  const HomepageScreenPopularAnime({
    super.key,
  });

  @override
  State<HomepageScreenPopularAnime> createState() =>
      _HomepageScreenPopularAnimeState();
}

final HomepageController homepageController = Get.find<HomepageController>();

class _HomepageScreenPopularAnimeState
    extends State<HomepageScreenPopularAnime> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetTopAiringAnimeModel>(
      future: getTopAiringAnime(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListviewWidget(
            itemCount: snapshot.data!.results!.length - 4,
            scrollDirection: Axis.horizontal,
            animeImage: (index) => snapshot.data!.results![index].image!,
            animeGenre1: (index) => snapshot.data!.results![index].genres![0],
            animeGenre2: (index) => snapshot.data!.results![index].genres![1],
            animeTitile: (index) => snapshot.data!.results![index].title!,
            onTap: (index) async {
              Get.to(
                () => AnimeDetailsScreen(
                  animeImage: snapshot.data!.results![index].image!,
                  animeName: snapshot.data!.results![index].title!,
                  animeID: snapshot.data!.results![index].id!,
                ),
              );
              await getAnimeDetails(snapshot.data!.results![index].id!);
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
