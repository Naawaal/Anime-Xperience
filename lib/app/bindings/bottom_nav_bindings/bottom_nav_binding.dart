import 'package:anime_xperience/app/controllers/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}
