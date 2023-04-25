import 'package:anime_xperience/app/controllers/homepage_controller/homepage_recent_episodes_controller.dart';
import 'package:anime_xperience/app/data/models/get_recent_episodes_model.dart';
import 'package:anime_xperience/app/ui/global_widgets/paged_gridview_widget.dart';
import 'package:anime_xperience/app/ui/pages/video_player_screen/web_view_player.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageRecentEpisodesSeeAll extends StatefulWidget {
  const HomepageRecentEpisodesSeeAll({super.key});

  @override
  State<HomepageRecentEpisodesSeeAll> createState() =>
      _HomepageRecentEpisodesSeeAllState();
}

final homeController = Get.put(HomepageRecentEpisodesController());

class _HomepageRecentEpisodesSeeAllState
    extends State<HomepageRecentEpisodesSeeAll> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recent Episodes',
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
      body: PagedGridviewWidget<GetRecentEpisodesModel>(
        onTap: (items, index) {
          Get.to(
            () => WebViewPlayerScreen(animeVideoLink: items.results![0].url!),
          );
        },
        pagingController: homeController.recentEpisodesPaginationController,
        animeTitle: (items, index) => items.results![0].title!,
        animeImage: (items, index) => items.results![0].image!,
        animeGenre1: (items, index) =>
            items.results![0].episodeNumber.toString(),
      ),
    );
  }
}
