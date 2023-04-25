import 'package:anime_xperience/app/controllers/homepage_controller/homepage__popular_anime_controller.dart';
import 'package:anime_xperience/app/ui/global_widgets/paged_gridview_widget.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepagePopularAnimeSeeAll extends StatefulWidget {
  const HomepagePopularAnimeSeeAll({super.key});

  @override
  State<HomepagePopularAnimeSeeAll> createState() =>
      _HomepagePopularAnimeSeeAllState();
}

final homepageController = Get.find<HomepagePopularAnimeController>();

class _HomepagePopularAnimeSeeAllState
    extends State<HomepagePopularAnimeSeeAll> {
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
      body: PagedGridviewWidget(
          pagingController: homepageController.popularAnimePaginationController,
          animeTitle: (items, index) => items.results![0].title!,
          animeImage: (items, index) => items.results![0].image!,
          animeGenre1: (items, index) => items.results![0].genres![0],
          onTap: (items, index) {}),
    );
  }
}
