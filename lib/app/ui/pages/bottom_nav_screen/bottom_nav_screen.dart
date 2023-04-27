import 'package:anime_xperience/app/controllers/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:anime_xperience/app/ui/pages/homepage_screen/homepage_screen.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:anime_xperience/app/ui/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

final bottomNavController = Get.find<BottomNavController>();

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> screens = const [
    HomepageScreen(),
    Center(child: Text('Search')),
    Center(child: Text('Likes')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            bottomNavController.currentIndex.value == 0
                ? 'Home'
                : bottomNavController.currentIndex.value == 1
                    ? 'Search'
                    : 'Favorites',
            style: const TextStyle(
              color: textColor,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            showSnackBar('Under Development', 'We are working on it.');
          },
          icon: const Icon(
            LineIcons.bars,
            color: textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar(
                  'Under Development', 'This feature takes more time.');
            },
            icon: const Icon(
              LineIcons.chromecast,
              color: textColor,
            ),
          ),
        ],
      ),
      body: Obx(() => IndexedStack(
            index: bottomNavController.currentIndex.value,
            children: screens,
          )),
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
              selectedIndex: bottomNavController.currentIndex.value,
              onTabChange: (value) {
                bottomNavController.onTabScreenChange(value);
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
                  text: 'Favorites',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
