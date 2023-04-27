import 'dart:async';

import 'package:anime_xperience/app/routes/name_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final RxInt counter = 0.obs;

  @override
  void onInit() {
    startCounter();
    super.onInit();
  }

  void startCounter() {
    Timer(
      3.seconds,
      () {
        Get.offAllNamed(NameRoutes.bottomNavScreen);
      },
    );
  }
}
