import 'package:anime_xperience/app/controllers/03_home_controller/home_controller.dart';
import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:anime_xperience/app/ui/theme/text_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenPopularAnime extends StatelessWidget {
  HomeScreenPopularAnime({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Popular header
            Text(
              TextConst.popularHeader,
              style: const TextStyle(
                color: headerTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // See all button
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
          height: Get.height * 0.38,
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
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: Get.width * 0.5,
                              height: Get.height * 0.3,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    snapshot.data!.results![index].image!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //Showing anime genres on  top  right of the image
                            Positioned(
                              top: 0,
                              right: 5,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  clipBehavior: Clip.antiAlias,
                                  direction: Axis.vertical,
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    Text(
                                      snapshot.data!.results![index].genres![0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.results![index].genres![1],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Showing anime title
                        Container(
                          width: Get.width * 0.5,
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            snapshot.data!.results![index].title!,
                            style: const TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
