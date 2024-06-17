import 'package:flutter/material.dart';
import 'package:dlc/models/unit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/GradeSubject.dart';

class ChapterOnePage extends StatelessWidget {
  static String videoID = 'egMWlD3fLJ8';
  final Unittwo unit;

  const ChapterOnePage({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(unit.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  unit.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  unit.nepaliName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  _launchURL(
                      'https://www.youtube.com/watch?v=${ChapterOnePage.videoID}');
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/youtube.png',
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
