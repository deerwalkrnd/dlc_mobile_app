import 'package:flutter/material.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';

class PressReleasePage extends StatefulWidget {
  const PressReleasePage({super.key});

  @override
  State<PressReleasePage> createState() => _PressReleasePageState();
}

class _PressReleasePageState extends State<PressReleasePage> {
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Press Release',
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
                       
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Text('Deerwalk Learning Center is an online platform for teaching and learning and was initiated to make education reachable to every corner of the country. It is packed with teaching videos of every chapters of English, Nepali, Mathematics, Social, and Science that are included in the syllabus prescribed by the Curriculum Development Center. Deerwalk Learning Center is developed to meet the distinct needs of today’s education system, so students can personalize their learning by creating their individual learning path.\n\n'
                            'The videos of Deerwalk Learning Center are designed to give students a great experience of learning. The 1600 plus video lectures delivers a detailed explanation of the course materials through engaging content, attractive images and graphics, and virtual teacher. Deerwalk Learning Center consists of complete teachings of six grades (Grade V - Grade X) and the work has been ongoing rapidly to create teaching videos of Grade I to IV.\n\n'
                         'Deerwalk Learning Center’s learning videos provides students with a holistic learning experience. The students in any corner with internet connectivity can get access to the best teachers and seek understanding through their teaching. The lessons are planned and crafted with deepest details and after experimenting with students in the physical classroom. This holistic approach has seen student engagement of over 17 minutes per session being spent by a student on the website.\n\n'
                         
                         
                         'Deerwalk Learning Center is working to bring revolution in the education system of Nepal. Deerwalk Learning Center’s three platforms - web, android and offline module provides seamless experiences of learning and bring concepts to life. The web version can be accessed by visiting dlc.dwit.edu.np. At present, the mobile version of Deerwalk Learning Center is available for Android users only and can be downloaded from playstore. Deerwalk Learning Center is dedicated to impart education for free and create the best citizen of the country and its offline module can be received for free by contacting us through following details.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                                  textAlign: TextAlign.justify,
                                ),
                       ),
                       decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(3)
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
