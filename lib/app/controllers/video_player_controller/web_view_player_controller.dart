import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPalyerController extends GetxController {
  late WebViewController controller;
  final box = GetStorage();

  @override
  void onClose() {
    controller.clearCache();
    super.onClose();
  }

  void removeAds() async {
    await controller.runJavascriptReturningResult(
        'document.querySelectorAll(".ads").forEach((el) => el.remove());');
  }
}
