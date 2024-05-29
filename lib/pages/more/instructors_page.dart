import 'package:flutter/material.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more/widgets/instructorcard.dart';

class InstructorsPage extends StatefulWidget {
  const InstructorsPage({super.key});

  @override
  State<InstructorsPage> createState() => _InstructorsPageState();
}

class _InstructorsPageState extends State<InstructorsPage> {
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

  final List<InstructorCard> instructors = [
    const InstructorCard(
      imagePath: "assets/images/instructors/1.png",
      name: 'Aakash Chandra Giri',
      messageUrl: 'sms:1234567890', 
      phoneUrl: 'tel:1234567890',
      linkedInUrl: 'https://www.linkedin.com/in/aakashchandragiri/', 
    ),
    const InstructorCard(
      imagePath: "assets/images/instructors/2.png",
      name: 'Aakancha Thapa',
      messageUrl: 'sms:0987654321', 
      phoneUrl: 'tel:0987654321', 
      linkedInUrl: 'https://www.linkedin.com/in/aakanchathapa/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                'Instructors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: _buildRows(instructors),
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

  List<Widget> _buildRows(List<InstructorCard> instructors) {
    return List.generate(
      (instructors.length / 2).ceil(),
      (index) {
        final start = index * 2;
        final end = (index * 2 + 2).clamp(0, instructors.length);
        return _buildRow(instructors.sublist(start, end));
      },
    );
  }

  Widget _buildRow(List<InstructorCard> instructors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: instructors.map((instructor) {
        return InstructorCard(
          imagePath: instructor.imagePath,
          name: instructor.name,
          messageUrl: instructor.messageUrl,
          phoneUrl: instructor.phoneUrl, 
          linkedInUrl: instructor.linkedInUrl, 
        );
      }).toList(),
    );
  }
}