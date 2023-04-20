import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListviewWidget extends StatelessWidget {
  final int? itemCount;
  final Axis scrollDirection;
  final String Function(int index) animeTitile;
  final String Function(int index) animeGenre1;
  final String Function(int index) animeGenre2;
  final String Function(int index) animeImage;

  const ListviewWidget({
    super.key,
    this.itemCount,
    required this.scrollDirection,
    required this.animeImage,
    required this.animeGenre1,
    required this.animeGenre2,
    required this.animeTitile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 5,
      height: Get.height * 0.36,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.antiAlias,
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(animeImage(index)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).marginOnly(left: 5, right: 5),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
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
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width * 0.45,
                height: Get.height * 0.05,
                child: Text(
                  animeTitile(index),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
