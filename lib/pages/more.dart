import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more/flipped_class_page.dart';
import 'package:dlc/pages/more/instructors_page.dart';
import 'package:dlc/pages/more/press_release_page.dart';
import 'package:dlc/pages/more/terms_of_use_page.dart';
import 'package:dlc/pages/more/widgets/morecard.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/home.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
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
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          const Center(
            child: Text(
              'More',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Wrap(
            runSpacing: 4, //4 multiple better
            children: [
              MoreCard(
                imagePath: "assets/images/more/flipped.png",
                title: "Flipped Class",
                navigateTo: FlippedClassPage(),
              ),
              MoreCard(
                imagePath: "assets/images/more/instructor.png",
                title: "Instructors",
                navigateTo: InstructorsPage(),
              ),
              MoreCard(
                imagePath: "assets/images/more/press.png",
                title: "Press Release",
                navigateTo: PressReleasePage(),
              ),
              MoreCard(
                imagePath: "assets/images/more/terms.png",
                title: "Terms of Use",
                navigateTo: TermsOfUsePage(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
