import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlippedClassPage extends StatefulWidget {
  const FlippedClassPage({super.key});

  @override
  State<FlippedClassPage> createState() => _FlippedClassPageState();
}

class _FlippedClassPageState extends State<FlippedClassPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '6BXBksnOVxM', 
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Flipped Class',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      'Flipped classes, by definition, “is a pedagogical model in which the typical lecture and homework elements of a course are reversed”. DLC, through this portal, aims at promoting flipped classes model across the country whereby students watch the lectures, in the form of short videos, in the home and utilize regular class hours for discussion.\n\n'
                      'Researches across the world have shown that student’s learning has significantly improved when taught in this model as compared to the traditional face-to-face model. We aim at improving the learning of each and every student of Nepal.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 200,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    onReady: () {
                      // Perform any actions when the player is ready
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}