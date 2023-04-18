import 'package:anime_xperience/app/controllers/03_home_controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
