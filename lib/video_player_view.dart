import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.url});

  final String url;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network('${widget.url}');
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _chewieController = ChewieController(
            autoInitialize: true,
            materialProgressColors: ChewieProgressColors(
              playedColor: Colors.red, // Set the played color
              handleColor: Colors.redAccent, // Set the handle color
              backgroundColor: Colors.grey.shade500, // Set the background color
              bufferedColor:
                  Colors.white.withOpacity(0.5), // Set the buffered color
              // Set the height of the video slider
              // You can adjust this value to decrease or increase the height
            ),
            videoPlayerController: _videoPlayerController,
            aspectRatio: 16 / 9);
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("My Title"),
        SizedBox(
          height: 15,
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: _videoPlayerController.value.isInitialized
              ? Chewie(
                  controller: _chewieController,
                )
              : SizedBox(
                  width: 15, height: 15, child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
