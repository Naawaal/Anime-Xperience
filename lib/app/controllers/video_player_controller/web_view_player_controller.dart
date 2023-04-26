import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPalyerController extends GetxController {
  late WebViewController? controller;

  RxString animeVideoLink = ''.obs;

  final box = GetStorage();

  void removeAds() async {
    if (controller != null) {
      await controller!.runJavascript(
          "document.getElementsByClassName('adsbygoogle').forEach((element) => element.remove());");
    }
  }

  void enableDownloading() async {
    if (controller != null) {
      await controller!.runJavascript(
          "document.getElementsByClassName('download').forEach((element) => element.remove());");
    }
  }
}
