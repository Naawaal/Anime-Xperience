import 'package:anime_xperience/app/controllers/homepage_controller/homepage_controller.dart';
import 'package:anime_xperience/app/ui/global_widgets/gridview_widget.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreenSeeAll extends StatefulWidget {
  const HomepageScreenSeeAll({Key? key}) : super(key: key);

  @override
  State<HomepageScreenSeeAll> createState() => _HomepageScreenSeeAllState();
}

class _HomepageScreenSeeAllState extends State<HomepageScreenSeeAll> {
  final HomepageController homepageController = Get.find();

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
      body: Obx(
        () => homepageController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridviewWidget(
                isLoading: homepageController.isLoading.value,
                itemCount: homepageController.animeList.length,
                animeTitile: (index) =>
                    homepageController.animeList[index].title!,
                animeGenre1: (index) =>
                    homepageController.animeList[index].genres![0],
                animeImage: (index) =>
                    homepageController.animeList[index].image!,
                scrollController: homepageController.scrollController.value,
              ),
      ),
    );
  }
}
