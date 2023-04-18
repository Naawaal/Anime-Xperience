import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 5,
      height: Get.height * 0.35,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.antiAlias,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).marginOnly(left: 5, right: 5),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width * 0.45,
                child: const Text(
                  'Anime Name',
                  style: TextStyle(
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
