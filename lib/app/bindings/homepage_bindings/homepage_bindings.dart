import 'package:anime_xperience/app/controllers/homepage_controller/homepage_controller.dart';
import 'package:get/get.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController());
  }
}
