import 'package:anime_xperience/app/controllers/search_controller/search_controller.dart';
import 'package:anime_xperience/app/ui/global_widgets/gridview_widget.dart';
import 'package:anime_xperience/app/ui/global_widgets/textformfield_widget.dart';
import 'package:anime_xperience/app/ui/pages/anime_detail_screen/anime_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final searchController = Get.put(SearchController());

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => TextformfieldWidget(
              hintText: 'Search Anime & Movies',
              controller: searchController.searchTextEditingController.value,
              onFieldSumbitted: (animeName) async {
                await searchController.onSearchSumbit(animeName);
              },
              onChanged: (animeName) async {
                await searchController.onSearchSumbit(animeName);
                setState(() {});
              },
            ).marginAll(5),
          ),
          Obx(
            () => Visibility(
              visible: searchController
                          .searchTextEditingController.value.text.length >
                      5
                  ? true
                  : false,
              child: Expanded(
                child: GridviewWidget(
                  itemCount: (index) => searchController.searchAnimeList.length,
                  scrollDirection: Axis.vertical,
                  animeImage: (index) => searchController
                      .searchAnimeList[index].results![index].image!,
                  animeGenre1: (index) => searchController
                      .searchAnimeList[index].results![index].subOrDub
                      .toString(),
                  animeTitile: (index) => searchController
                      .searchAnimeList[index].results![index].title!,
                  onTap: (index) {
                    Get.to(
                      AnimeDetailsScreen(
                        animeId: searchController
                            .searchAnimeList[index].results![index].id!,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
