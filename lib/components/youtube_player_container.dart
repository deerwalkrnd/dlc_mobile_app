import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerContainer extends StatelessWidget {
  final Widget player;
  final YoutubePlayerController controller;
  final String selectedVideoTitle;

  YoutubePlayerContainer(
      {super.key,
      required this.player,
      required this.controller,
      required this.selectedVideoTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Text(
              selectedVideoTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.headline700,
            ),
          ),
          Padding(padding: const EdgeInsets.all(10), child: player),
        ],
      ),
    );
  }
}
