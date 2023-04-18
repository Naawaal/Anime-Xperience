import 'package:anime_xperience/app/controllers/homepage_controller/homepage_controller.dart';
import 'package:anime_xperience/app/routes/name_routes.dart';
import 'package:anime_xperience/app/ui/global_widgets/header_text_widget.dart';
import 'package:anime_xperience/app/ui/pages/homepage_screen/homepage_screen_popular_anime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

final HomepageController homepageController = Get.find<HomepageController>();

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderTextWidget(
              headerText: 'Popular Anime',
              buttonText: 'see all',
              onPressed: () {
                Get.toNamed(NameRoutes.seeallScreen);
              },
            ),
            const HomepageScreenPopularAnime()
          ],
        ),
      ),
    );
  }
}
