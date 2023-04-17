import 'package:anime_xperience/app/routes/name_routes.dart';
import 'package:anime_xperience/app/ui/pages/02_homepage_screen/homepage_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: NameRoutes.homepage,
          page: () => HomepageScreen(),
        ),
      ];
}
