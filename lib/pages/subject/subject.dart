import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/subject/chapters.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
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
      appBar: TopNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: SingleChildScrollView(
        child:Column(
        children: [
          Padding(padding: EdgeInsets.all(12)),
          Center(
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

  Widget subjectContainer({required String imagePath, required String subjectName}) {
    return GestureDetector(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.35),
              border: Border.all(color: Colors.white, width: 0.25),
            ),
            padding: EdgeInsets.fromLTRB(10,10,10,5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subjectName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5))
              ],
            ),
          ),
        ),
      ),
      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChapterPage()),
                          );
                        },
    );
    
  }
}