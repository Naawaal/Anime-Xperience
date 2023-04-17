import 'package:get/get.dart';

class HomepageController extends GetxController {
  final currentIndex = 0.obs;

  void onTabScreenChange(int index) {
    currentIndex.value = index;
  }
}
