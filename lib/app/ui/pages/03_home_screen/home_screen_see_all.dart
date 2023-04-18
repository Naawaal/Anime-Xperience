import 'package:anime_xperience/app/data/models/get_top_airing_anime_model.dart';
import 'package:anime_xperience/app/data/services/api/get_top_airing_anime_api.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:anime_xperience/app/ui/theme/text_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenSeeAllScreen extends StatelessWidget {
  const HomeScreenSeeAllScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextConst.popularHeader,
          style: const TextStyle(
            color: headerTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<GetTopAiringAnimeModel>(
        future: getTopAiringAnime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(6),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                childAspectRatio: 0.7,
              ),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              shrinkWrap: true,
              clipBehavior: Clip.antiAlias,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: Get.width * 0.5,
                          height: Get.height * 0.25,
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
    );
  }
}
