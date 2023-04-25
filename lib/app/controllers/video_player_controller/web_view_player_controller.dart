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
    // advance ads blocking method for webview flutter plugin
    await controller.runJavascriptReturningResult(
        "var script = document.createElement('script');script.type = 'text/javascript';script.src = 'https://raw.githubusercontent.com/abp-filters/abp-filters-anti-cv/master/filter.txt';document.getElementsByTagName('head')[0].appendChild(script);");
  }

  void enableDownloading() async {}
}
