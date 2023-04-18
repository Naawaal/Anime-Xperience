import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:anime_xperience/app/ui/global_widgets/gridview_widget.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';

class HomepageScreenSeeAll extends StatefulWidget {
  const HomepageScreenSeeAll({super.key});

  @override
  State<HomepageScreenSeeAll> createState() => _HomepageScreenSeeAllState();
}

class _HomepageScreenSeeAllState extends State<HomepageScreenSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Anime',
          style: TextStyle(
            color: headerTextColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: headerTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<GetTopAiringAnimeModel>(
        future: getTopAiringAnime(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridviewWidget(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.results!.length,
              animeTitile: (index) => snapshot.data!.results![index].title!,
              animeGenre1: (index) => snapshot.data!.results![index].genres![0],
              animeGenre2: (index) => snapshot.data!.results![index].genres![1],
              animeImage: (index) => snapshot.data!.results![index].image!,
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
