import 'package:anime_xperience/app/controllers/video_player_controller/web_view_player_controller.dart';
import 'package:anime_xperience/app/data/services/website_scraper/fetch_url.dart';
import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
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
    super.initState();
    fetchDirectVideoUrl(widget.animeVideoLink);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        backgroundColor: backgroundColor,
        initialUrl: '${box.read('videoLink')}',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          videoController.controller = webViewController;
        },
        allowsInlineMediaPlayback: true,
        onPageFinished: (_) => videoController.removeAds(),
        navigationDelegate: (NavigationRequest request) {
          // Prevent WebView from navigating away from initial page
          if (request.url != box.read('videoLink')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}