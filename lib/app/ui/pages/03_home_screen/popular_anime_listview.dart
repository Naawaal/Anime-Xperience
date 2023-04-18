import 'package:anime_xperience/app/controllers/03_home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularAnimeListviewBuilder extends StatelessWidget {
  final snapshot;
  final index;

  PopularAnimeListviewBuilder({super.key, this.snapshot, this.index});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width * 0.5,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(snapshot.data!.results![index].image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // adding to show generes of anime
        Positioned(
          bottom: 0,
          child: Container(
            width: Get.width * 0.5,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Text(
              snapshot.data!.results![index].genres,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
