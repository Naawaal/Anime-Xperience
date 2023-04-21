import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagedGridviewWidget<T> extends StatelessWidget {
  final String Function(T, int index) animeTitle;
  final String Function(T, int index) animeImage;
  final String Function(T, int index) animeGenre1;
  final PagingController<int, T> pagingController;
  final Function(T, int index) onTap;
  // final Widget Function(BuildContext, T, int) itemBuilder;

  const PagedGridviewWidget({
    super.key,
    required this.pagingController,
    required this.animeTitle,
    required this.animeImage,
    required this.animeGenre1,
    required this.onTap,
    // required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, T>(
      showNewPageProgressIndicatorAsGridChild: true,
      showNewPageErrorIndicatorAsGridChild: true,
      showNoMoreItemsIndicatorAsGridChild: true,
      addSemanticIndexes: true,
      addRepaintBoundaries: true,
      pagingController: pagingController,
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(6),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 0.60,
      ),
      shrinkWrap: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builderDelegate:
          PagedChildBuilderDelegate<T>(itemBuilder: (context, item, index) {
        return Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () => onTap(item, index),
                  child: Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.30,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(animeImage(item, index)),
                        fit: BoxFit.cover,
                      ),
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
                          animeGenre1(item, index),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
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
                animeTitle(item, index),
                style: const TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
