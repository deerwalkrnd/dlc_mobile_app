// ignore_for_file: unused_import

import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/updates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlippedClassPage extends StatefulWidget {
  const FlippedClassPage({super.key});

  @override
  State<FlippedClassPage> createState() => _FlippedClassPageState();
}

class _FlippedClassPageState extends State<FlippedClassPage> {
  // int _selectedIndex = 2;

  final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'egMWlD3fLJ8',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return DefaultLayout(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(AppLocalizations.of(context)!.flippedTitle,
                          style: AppTextStyles.headline700),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            AppLocalizations.of(context)!.flippedCLass,
                            style: AppTextStyles.bodyText300,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.07,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: getScreenHeight(context) * 0.25,
                          width: getScreenWidth(context) * 0.9,
                          child: player,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
