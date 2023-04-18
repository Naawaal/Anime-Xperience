import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void onTabScreenChange(int index) {
    currentIndex.value = index;
  }
}
