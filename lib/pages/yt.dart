// ignore_for_file: unnecessary_const

import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:dlc/models/unit.dart';
import '../models/GradeSubject.dart';
import '../components/topnavbar.dart'; // Import the top navigation bar component here
import '../components/bottomnav.dart'; // Import the bottom navigation bar component here

class FinalPage extends StatefulWidget {
  final sub_name_final;
  final Unittwo unit;
  final String title;
  final String url;

  FinalPage({
    super.key,
    required this.unit,
    required this.title,
    required this.url,
    required this.sub_name_final,
  });

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
      appBar: const TopNavBar(), // Use the custom TopNavBar here

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BackButton(
                  color: Colors.white,
                ),
               
                Expanded(
                  child: Text(
                    widget.sub_name_final ?? '',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white
                      ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: null,
                        decoration: const InputDecoration(
                          hintText: 'Search for the desired topic',
                          border: InputBorder.none,
                        ),
                        onChanged: null,
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10,20,10),
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white
                      ),
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5,10,5),
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
      ),
    );
  }
}
