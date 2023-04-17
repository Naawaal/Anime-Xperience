import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

void showSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(5),
      isDismissible: true,
      dismissDirection: DismissDirection.down,
      forwardAnimationCurve: Curves.easeIn,
      icon: const Icon(
        LineIcons.exclamationCircle,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING);
}
