import 'package:anime_xperience/app/controllers/video_player_controller/web_view_player_controller.dart';
import 'package:anime_xperience/app/data/services/website_scraper/fetch_url.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPlayerScreen extends StatefulWidget {
  final String animeVideoLink;
  const WebViewPlayerScreen({super.key, required this.animeVideoLink});

  @override
  State<WebViewPlayerScreen> createState() => _WebViewPlayerScreenState();
}

final videoController = Get.put(WebviewPalyerController());

final box = GetStorage();

class _WebViewPlayerScreenState extends State<WebViewPlayerScreen> {
  @override
  void initState() {
    videoController.animeVideoLink.value = box.read('videoLink');
    super.initState();
    fetchDirectVideoUrl(episodeLink: widget.animeVideoLink);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        zoomEnabled: false,
        backgroundColor: backgroundColor,
        initialUrl: videoController.animeVideoLink.value,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          videoController.controller = webViewController;
          videoController.controller!.clearCache();
          final CookieManager cookieManager = CookieManager();
          cookieManager.clearCookies();
        },
        allowsInlineMediaPlayback: true,
        onPageFinished: (_) => videoController.removeAds(),
        navigationDelegate: (NavigationRequest request) {
          if (request.url != box.read('videoLink')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
