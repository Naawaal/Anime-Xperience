import 'package:anime_xperience/app/bindings/bottom_nav_bindings/bottom_nav_binding.dart';
import 'package:anime_xperience/app/bindings/homepage_bindings/homepage_bindings.dart';
import 'package:anime_xperience/app/bindings/splash_bindings/splash_bindings.dart';
import 'package:anime_xperience/app/routes/name_routes.dart';
import 'package:anime_xperience/app/ui/pages/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:anime_xperience/app/ui/pages/homepage_screen/homepage_recent_episodes_sell_all.dart';
import 'package:anime_xperience/app/ui/pages/homepage_screen/homepage_screen.dart';
import 'package:anime_xperience/app/ui/pages/homepage_screen/homepage_screen_popular_anime_see_all.dart';
import 'package:anime_xperience/app/ui/pages/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: NameRoutes.spalshScreen,
          page: () => const SplashScreen(),
          title: 'Splash Screen',
          binding: SplashBindings(),
        ),
        GetPage(
          name: NameRoutes.bottomNavScreen,
          page: () => const BottomNavScreen(),
          title: 'Bottom Navigation Screen',
          binding: BottomNavBinding(),
        ),
        GetPage(
          name: NameRoutes.homepageScreen,
          page: () => const HomepageScreen(),
          title: 'Homepage Screen',
          binding: HomepageBinding(),
        ),
        GetPage(
          name: NameRoutes.homepagePopularAnimeSeeAll,
          page: () => const HomepagePopularAnimeSeeAll(),
          title: 'Popular Anime Screen',
          binding: HomepageBinding(),
        ),
        GetPage(
          name: NameRoutes.homepageRecentEpisodesSeeAll,
          page: () => const HomepageRecentEpisodesSeeAll(),
          title: 'Recent Episodes Screen',
          binding: HomepageBinding(),
        ),
      ];
}
