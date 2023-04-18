import 'package:anime_xperience/app/ui/pages/03_home_screen/home_screen_recent_episodes.dart';
import 'package:anime_xperience/app/ui/pages/03_home_screen/home_screen_popular_anime.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Xperience'),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 05),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeScreenPopularAnime(),
              HomeScreenRecentEpisodes(),
            ],
          ),
        ),
      ),
    );
  }
}
