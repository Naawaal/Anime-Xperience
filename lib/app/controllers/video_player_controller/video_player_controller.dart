import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllers extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  final box = GetStorage();

  void initState() {
    super.onInit();
    initializePlayer(box.read('720p'));
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  Future<void> initializePlayer(String videoLink) async {
    videoPlayerController = VideoPlayerController.network(videoLink);

    await Future.wait([videoPlayerController.initialize()]);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: false,
      allowMuting: true,
      showControls: true,
      showOptions: false,
      showControlsOnInitialize: true,
      aspectRatio: 16 / 9,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      autoInitialize: true,
      placeholder: const Center(
        child: CircularProgressIndicator(),
      ),
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () {},
            iconData: LineIcons.list,
            title: '360p',
          ),
          OptionItem(
            onTap: () {},
            iconData: LineIcons.list,
            title: '480p',
          ),
          OptionItem(
            onTap: () {},
            iconData: LineIcons.list,
            title: '720p',
          ),
          OptionItem(
            onTap: () {},
            iconData: LineIcons.list,
            title: '1080p',
          ),
        ];
      },
    );
    update();
  }
}
