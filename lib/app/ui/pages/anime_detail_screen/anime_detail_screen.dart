import 'package:anime_xperience/app/data/models/get_anime_details_model.dart';
import 'package:anime_xperience/app/data/services/api/get_anime_details.dart';
import 'package:anime_xperience/app/ui/pages/video_player_screen/video_player_screen.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/services/api/get_episodes_link.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final String? animeId;
  const AnimeDetailsScreen({
    super.key,
    this.animeId,
  });

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

final box = GetStorage();

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Back',
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: iconColor,
          ),
        ),
      ),
      body: FutureBuilder<GetAnimeDetailsModel>(
        future: getAnimeDetails(widget.animeId!),
        builder: (context, AsyncSnapshot<GetAnimeDetailsModel> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.25,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                snapshot.data!.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.25,
                        width: Get.width,
                        color: blackColor.withOpacity(0.7),
                      ),
                      Positioned(
                        top: Get.height * 0.12,
                        child: Container(
                          height: Get.height * 0.25,
                          width: Get.width * 40 / 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  snapshot.data!.image!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      snapshot.data!.title!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ).marginOnly(top: 110.0),
                  ),
                  const SizedBox(
                    height: 05,
                  ),
                  FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      snapshot.data!.otherName!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  const Divider().marginOnly(left: 5, right: 5),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 5,
                    runSpacing: 5,
                    clipBehavior: Clip.antiAlias,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Genres: ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(label: Text(snapshot.data!.genres![0])),
                    ],
                  ),
                  const SizedBox(
                    height: 05,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Release : ${snapshot.data!.releaseDate}',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Total Episodes: ${snapshot.data!.totalEpisodes}',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Type : ${snapshot.data!.type}',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Dub/Sub: ${snapshot.data!.subOrDub}',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Status: ${snapshot.data!.status}',
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.description!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ).paddingAll(5),
                  const Text(
                    "Episodes",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ).marginOnly(top: 3.0, bottom: 3.0),
                  const Text(
                    textAlign: TextAlign.center,
                    "Note: If the desired episode doesn't play, you can try clicking on it again to watch it or exit and start playing it once more.",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ).marginAll(5),
                  const SizedBox(
                    height: 05,
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(5.0),
                    clipBehavior: Clip.antiAlias,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.episodes!.length,
                    dragStartBehavior: DragStartBehavior.start,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: InkWell(
                          onTap: () async {
                            Get.to(
                              () => VideoPlayer(
                                episodesID: snapshot.data!.episodes![index].id!,
                              ),
                            );
                            await box.write("episodesID",
                                snapshot.data!.episodes![index].id!);
                            await getAnimeEpisodesLink();
                          },
                          child: Text(
                            snapshot.data!.episodes![index].number!.toString(),
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
