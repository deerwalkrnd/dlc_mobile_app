import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/subject/chapters.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/subject/widgets/subjectcard.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _HomePageState();
}

class _HomePageState extends State<SubjectPage> {
  int _selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(12)),
            const Center(
              child: Text(
                'Choose Your Subject',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            subjectContainer(
              imagePath: "assets/images/subjects/maths.jpg",
              subjectName: 'Mathematics',
            ),
            subjectContainer(
              imagePath: "assets/images/subjects/phy.jpg",
              subjectName: 'Science',
            ),
            subjectContainer(
              imagePath: "assets/images/subjects/eng.jpg",
              subjectName: 'English',
            ),
            subjectContainer(
              imagePath: "assets/images/subjects/maths.jpg",
              subjectName: 'Mathematics',
            ),
            subjectContainer(
              imagePath: "assets/images/subjects/phy.jpg",
              subjectName: 'Science',
            ),
            subjectContainer(
              imagePath: "assets/images/subjects/eng.jpg",
              subjectName: 'English',
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