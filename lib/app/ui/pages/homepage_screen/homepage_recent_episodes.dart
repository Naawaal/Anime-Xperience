import 'package:anime_xperience/app/data/models/get_recent_episodes_model.dart';
import 'package:anime_xperience/app/data/services/api/get_recent_episodes.dart';
import 'package:anime_xperience/app/ui/global_widgets/gridview_widget.dart';
import 'package:anime_xperience/app/ui/pages/video_player_screen/web_view_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreenRecentEpisodes extends StatefulWidget {
  const HomepageScreenRecentEpisodes({super.key});

  @override
  State<HomepageScreenRecentEpisodes> createState() =>
      _HomepageScreenRecentEpisodesState();
}

class _HomepageScreenRecentEpisodesState
    extends State<HomepageScreenRecentEpisodes> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetRecentEpisodesModel>(
      future: getRecentEpisodes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridviewWidget(
            itemCount: 4,
            scrollDirection: Axis.vertical,
            animeImage: (index) => snapshot.data!.results![index].image!,
            animeGenre1: (index) =>
                snapshot.data!.results![index].episodeNumber.toString(),
            animeTitile: (index) => snapshot.data!.results![index].title!,
            onTap: (index) {
              Get.to(
                () => WebViewPlayerScreen(
                    animeVideoLink: snapshot.data!.results![index].url!),
              );
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
