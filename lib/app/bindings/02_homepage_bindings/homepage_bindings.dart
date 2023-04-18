import 'package:anime_xperience/app/controllers/02_homepage_controller/homepage_controller.dart';
import 'package:get/get.dart';

class HomepageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(() => HomepageController());
  }
}
