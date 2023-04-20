import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagedGridviewWidget<T> extends StatelessWidget {
  final Axis? scrollDirection;
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const PagedGridviewWidget({
    super.key,
    this.scrollDirection,
    required this.pagingController,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, T>(
      addSemanticIndexes: true,
      addRepaintBoundaries: true,
      pagingController: pagingController,
      addAutomaticKeepAlives: true,
      scrollDirection: scrollDirection ?? Axis.vertical,
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
      builderDelegate: PagedChildBuilderDelegate<T>(itemBuilder: itemBuilder),
    );
  }
}
