import 'package:anime_xperience/app/controllers/03_home_controller/home_controller.dart';
import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:anime_xperience/app/ui/theme/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenTop extends StatelessWidget {
  HomeScreenTop({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TextConst.popularHeader,
              style: const TextStyle(
                color: headerTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                TextConst.seeAll,
                style: const TextStyle(
                  color: headerTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: Get.height * 0.3,
          child: FutureBuilder<GetTopAiringAnimeModel>(
            future: getTopAiringAnime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      Text(
                        TextConst.loading,
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      color: headerTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text(
                    'No data',
                    style: TextStyle(
                      color: headerTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data!.results![index].image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
