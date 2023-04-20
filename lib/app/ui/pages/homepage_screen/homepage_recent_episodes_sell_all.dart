import 'package:anime_xperience/app/controllers/homepage_controller/homepage_recent_episodes_controller.dart';
import 'package:anime_xperience/app/data/models/get_recent_episodes_model.dart';
import 'package:anime_xperience/app/ui/global_widgets/paged_gridview_widget.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageRecentEpisodesSeeAll extends StatefulWidget {
  const HomepageRecentEpisodesSeeAll({super.key});

  @override
  State<HomepageRecentEpisodesSeeAll> createState() =>
      _HomepageRecentEpisodesSeeAllState();
}

final homeController = Get.put(HomepageRecentEpisodesController());

class _HomepageRecentEpisodesSeeAllState
    extends State<HomepageRecentEpisodesSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recent Episodes',
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
      body: PagedGridviewWidget<GetRecentEpisodesModel>(
        pagingController: homeController.recentEpisodesPaginationController,
        itemBuilder: (context, item, index) {
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
                        image: CachedNetworkImageProvider(
                          item.results![0].image!,
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
                            item.results![0].episodeNumber.toString(),
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
              const SizedBox(
                height: 05,
              ),
              SizedBox(
                width: Get.width * 0.45,
                height: Get.height * 0.05,
                child: Text(
                  item.results![0].title!,
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
      ),
    );
  }
}
