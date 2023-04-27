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
          centerTitle: true,
          backgroundColor: appBarColor,
          titleTextStyle: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
