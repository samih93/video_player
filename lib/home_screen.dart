import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videoplayerproject/video_player_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("video")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            VideoPlayerView(
              url:
                  "https://trapflix.com/upload/videos/2022/12/45ZSLuKmdrscBfacrxek_16_f842ab853817a8913bd773746d29f359_video.mp4",
            ),
          ],
        ),
      ),
    );
  }
}
