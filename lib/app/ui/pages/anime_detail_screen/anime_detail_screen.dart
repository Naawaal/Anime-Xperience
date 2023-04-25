import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final String? animeImage;
  final String? animeName;
  final String? animeID;

  const AnimeDetailsScreen({
    super.key,
    this.animeImage,
    this.animeName,
    this.animeID,
  });

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      image: CachedNetworkImageProvider(widget.animeImage!),
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
                        image: CachedNetworkImageProvider(widget.animeImage!),
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
                widget.animeName!,
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
              child: Text(
                "ID: ${widget.animeID}",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const Divider().marginOnly(left: 5, right: 5),
            Row()
          ],
        ),
      ),
    );
  }
}
