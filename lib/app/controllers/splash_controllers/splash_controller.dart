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
    counter.value = 5;
    Timer.periodic(
      1.seconds,
      (timer) {
        if (counter.value == 0) {
          timer.cancel();
          Get.offAllNamed(NameRoutes.bottomNavScreen);
        } else {
          counter.value--;
        }
      },
    );
  }
}
