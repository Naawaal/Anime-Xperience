import 'package:anime_xperience/app/controllers/search_controller/search_controller.dart';
import 'package:anime_xperience/app/ui/global_widgets/gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenGridView extends StatefulWidget {
  const SearchScreenGridView({super.key});

  @override
  State<SearchScreenGridView> createState() => _SearchScreenGridViewState();
}

final searchController = Get.put(SearchController());

class _SearchScreenGridViewState extends State<SearchScreenGridView> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible:
            searchController.searchTextEditingController.value.text.length > 5
                ? true
                : false,
        child: Expanded(
          child: GridviewWidget(
            itemCount: (index) => searchController.searchAnimeList.length,
            scrollDirection: Axis.vertical,
            animeImage: (index) =>
                searchController.searchAnimeList[index].results![index].image!,
            animeGenre1: (index) => searchController
                .searchAnimeList[index].results![index].subOrDub
                .toString(),
            animeTitile: (index) =>
                searchController.searchAnimeList[index].results![index].title!,
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
