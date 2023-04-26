import 'package:anime_xperience/app/controllers/video_player_controller/video_player_controller.dart';
import 'package:anime_xperience/app/data/models/get_anime_episodes_url_model.dart';
import 'package:anime_xperience/app/data/services/api/get_episodes_link.dart';
import 'package:chewie/chewie.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetAnimeEpisodesUrlModel>(
        future: getAnimeEpisodesLink(widget.episodesID),
        builder: (context, snapshot) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: videoPlayerController.chewieController != null &&
                          videoPlayerController.chewieController!
                              .videoPlayerController.value.isInitialized
                      ? Chewie(
                          controller: videoPlayerController.chewieController!,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text(
                              'Loading',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
