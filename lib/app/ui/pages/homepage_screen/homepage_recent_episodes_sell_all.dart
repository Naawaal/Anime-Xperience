import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';

class HomepageRecentEpisodesSeeAll extends StatefulWidget {
  const HomepageRecentEpisodesSeeAll({super.key});

  @override
  State<HomepageRecentEpisodesSeeAll> createState() =>
      _HomepageRecentEpisodesSeeAllState();
}

class _HomepageRecentEpisodesSeeAllState
    extends State<HomepageRecentEpisodesSeeAll> {
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
    );
  }
}
