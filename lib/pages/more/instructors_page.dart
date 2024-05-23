import 'package:flutter/material.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';

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

  final List<Instructor> instructors = [
    Instructor(imagePath: "assets/images/instructors/1.png", name: 'Aakash Chandra Giri'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
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
              padding: EdgeInsets.all(10),
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

  List<Widget> _buildRows(List<Instructor> instructors) {
    return List.generate(
      (instructors.length / 2).ceil(),
      (index) {
        final start = index * 2;
        final end = (index * 2 + 2).clamp(0, instructors.length);
        return _buildRow(instructors.sublist(start, end));
      },
    );
  }

  Widget _buildRow(List<Instructor> instructors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: instructors.map((instructor) {
        return InstructorCard(
          imagePath: instructor.imagePath,
          name: instructor.name,
        );
      }).toList(),
    );
  }
}

class Instructor {
  final String imagePath;
  final String name;

  const Instructor({
    required this.imagePath,
    required this.name,
  });
}

class InstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const InstructorCard({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          IconRow(),
          Padding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/instructors/icons/1.png"),
        SizedBox(width: 10),
        Image.asset("assets/images/instructors/icons/2.png"),
        SizedBox(width: 10),
        Image.asset("assets/images/instructors/icons/3.png"),
      ],
    );
  }
}
