import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dlc/models/unit.dart';
import '../models/GradeSubject.dart';
import '../components/topnavbar.dart'; // Import the top navigation bar component here
import '../components/bottomnav.dart'; // Import the bottom navigation bar component here

class FinalPage extends StatefulWidget {
  final Unittwo unit;
  final String title;
  final String url;

  FinalPage({
    Key? key,
    required this.unit,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(), // Use the custom TopNavBar here

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.title,
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
                  widget.unit.nepaliName,
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
                  _launchURL(widget.url);
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

      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ), // Optionally integrate this if needed
    );
  }
}
