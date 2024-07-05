import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerContainer extends StatelessWidget {
  final String selectedVideoTitle;

  YoutubePlayerContainer(
      {super.key, required String videoId, required this.selectedVideoTitle}) {

    this._controller = new YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoId) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    this._controller.load(YoutubePlayer.convertUrlToId(videoId) ?? '');
  }

  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Text(
              selectedVideoTitle!,
              textAlign: TextAlign.center,
              style: AppTextStyles.headline700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
            ),
          ),
        ],
      ),
    );
  }
}
