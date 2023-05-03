import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../res/colors/colors.dart';

class ChiewePlayerView extends StatefulWidget {
  const ChiewePlayerView({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ChiewePlayerViewState createState() => _ChiewePlayerViewState();
}

class _ChiewePlayerViewState extends State<ChiewePlayerView> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
      'https://cdn.bmstudiopk.com/vop/live/playlist.m3u8',
    );
    videoPlayerController!.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      allowPlaybackSpeedChanging: true,
      allowMuting: true,
      allowFullScreen: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColor.redColor,
        handleColor: AppColor.redColor,
        backgroundColor: Colors.transparent,
        bufferedColor: Colors.white.withOpacity(0.5),
      ),
      placeholder: const Center(child: CircularProgressIndicator()),
      errorBuilder: (context, errorMessage) {
        return const Center(child: CircularProgressIndicator());
      },

      // Set the controls color
    );

    // Set the device orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Reset the device orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chewie(
        controller: chewieController!,
      ),
    );
  }
}
