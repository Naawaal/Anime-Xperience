import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridviewWidget extends StatelessWidget {
  final int? itemCount;
  final Axis scrollDirection;
  final int? index;
  final String Function(int index) animeTitile;
  final String Function(int index) animeGenre1;
  final String Function(int index) animeGenre2;
  final String Function(int index) animeImage;
  const GridviewWidget(
      {super.key,
      this.itemCount,
      required this.scrollDirection,
      required this.animeTitile,
      required this.animeGenre1,
      required this.animeGenre2,
      required this.animeImage,
      this.index});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(6),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 0.65,
      ),
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      shrinkWrap: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width * 0.45,
                  height: Get.height * 0.30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(animeImage(index)),
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
                          animeGenre1(index),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          animeGenre2(index),
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
            const SizedBox(
              height: 05,
            ),
            Container(
              width: Get.width * 0.5,
              margin: const EdgeInsets.only(right: 10),
              child: Text(
                animeTitile(index),
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
}
