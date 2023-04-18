import 'package:anime_xperience/app/controllers/02_homepage_controller/homepage_controller.dart';
import 'package:anime_xperience/app/ui/pages/03_home_screen/home_screen.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});

  // HomepageController Instance for the bottom navigation bar
  final homePageController = Get.put(HomepageController());

  // List of screens to be displayed on the bottom navigation bar
  final List<Widget> _screens = const [
    HomeScreen(),
    Center(child: Text('Search')),
    Center(child: Text('Likes')),
    Center(child: Text('Downloads')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            homePageController.currentIndex.value == 0
                ? 'Anime Xperience'
                : homePageController.currentIndex.value == 1
                    ? 'Search'
                    : homePageController.currentIndex.value == 2
                        ? 'Likes'
                        : 'Downloads',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cast_connected_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // Obx is used to update the screen when the currentIndex value changes
      body: Obx(
        () => _screens[homePageController.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              rippleColor: Colors.grey,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 400),
              gap: 8,
              color: Colors.white70,
              activeColor: headerTextColor,
              iconSize: 25,
              textSize: 25,
              tabBorderRadius: 12,
              style: GnavStyle.google,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              selectedIndex: homePageController.currentIndex.value,
              onTabChange: (value) {
                homePageController.onTabScreenChange(value);
              },
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.download,
                  text: 'Downloads',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
