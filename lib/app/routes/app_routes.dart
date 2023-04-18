import 'package:anime_xperience/app/bindings/02_homepage_bindings/homepage_bindings.dart';
import 'package:anime_xperience/app/bindings/03_home_bindings/home_bindings.dart';
import 'package:anime_xperience/app/routes/name_routes.dart';
import 'package:anime_xperience/app/ui/pages/02_homepage_screen/homepage_screen.dart';
import 'package:anime_xperience/app/ui/pages/03_home_screen/home_screen.dart';
import 'package:anime_xperience/app/ui/pages/03_home_screen/home_screen_see_all.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: NameRoutes.homepage,
          page: () => HomepageScreen(),
          binding: HomepageBindings(),
          title: 'Homepage',
        ),
        GetPage(
          name: NameRoutes.home,
          page: () => const HomeScreen(),
          title: 'Home',
          binding: HomeBindings(),
        ),
        GetPage(
          name: NameRoutes.homeScreenSeeAll,
          page: () => const HomeScreenSeeAllScreen(),
          title: 'See All',
        ),
      ];
}
