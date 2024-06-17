import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';
import 'package:url_launcher/url_launcher.dart';

class FlippedClassPage extends StatefulWidget {
  static String videoID = 'egMWlD3fLJ8';
  const FlippedClassPage({super.key});

  @override
  State<FlippedClassPage> createState() => _FlippedClassPageState();
}

class _FlippedClassPageState extends State<FlippedClassPage> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UpdatesPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('Flipped Class', style: AppTextStyles.headline700),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Flipped classes, by definition, “is a pedagogical model in which the typical lecture and homework elements of a course are reversed”. DLC, through this portal, aims at promoting flipped classes model across the country whereby students watch the lectures, in the form of short videos, in the home and utilize regular class hours for discussion.\n\n'
                      'Researches across the world have shown that student’s learning has significantly improved when taught in this model as compared to the traditional face-to-face model. We aim at improving the learning of each and every student of Nepal.',
                      style: AppTextStyles.bodyText300,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    _launchURL(
                        'https://www.youtube.com/watch?v=${FlippedClassPage.videoID}');
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.black38),
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
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
