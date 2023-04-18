import 'package:anime_xperience/app/ui/global_widgets/header_text_widget.dart';
import 'package:anime_xperience/app/ui/global_widgets/listview_widget.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            HeaderTextWidget(
                headerText: 'Popular Anime', buttonText: 'see all'),
            ListviewWidget(),
          ],
        ),
      ),
    );
  }
}
