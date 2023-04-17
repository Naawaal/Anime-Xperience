import 'package:anime_xperience/app/routes/app_routes.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeXperience extends StatelessWidget {
  const AnimeXperience({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime Xperience',
      getPages: AppRoutes.appRoutes(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          titleTextStyle: TextStyle(
            color: headerTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
