import 'package:anime_xperience/app/controllers/video_player_controller/video_player_controller.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayer extends StatefulWidget {
  final String episodesID;
  const VideoPlayer({super.key, required this.episodesID});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

final videoPlayerController = Get.put(VideoPlayerControllers());

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();
    const BetterPlayerCacheConfiguration(
      useCache: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VideoPlayerControllers>(
        init: VideoPlayerControllers(),
        builder: (controller) {
          return Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer.network(
                videoPlayerController.box.read('episodes')!,
                betterPlayerConfiguration: const BetterPlayerConfiguration(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  looping: true,
                  fit: BoxFit.cover,
                  autoDispose: true,
                  fullScreenAspectRatio: 16 / 9,
                  expandToFill: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
