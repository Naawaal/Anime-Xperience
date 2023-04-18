import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:anime_xperience/app/ui/global_widgets/listview_widget.dart';
import 'package:flutter/material.dart';

class HomepageScreenPopularAnime extends StatelessWidget {
  const HomepageScreenPopularAnime({
    super.key,
  });

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
