import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    List<int> grades = [11, 10, 9, 8, 7, 6, 5, 4];

    return Scaffold(
      appBar: TopNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(12.0)),
            const Center(
              child: Text(
                'What topic do you want to learn?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                        decoration: InputDecoration(
                          hintText: 'Search for the desired topic',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: const Text(
                "Choose Your Class",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: grades.map((grade) => GradeCard(grade: grade)).toList(),
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

class GradeCard extends StatelessWidget {
  final int grade;

  const GradeCard({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                blurRadius: 6,
                offset: const Offset(-6.0, 6.00),
              ),
            ],
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0f5288),
                Color(0xFF5A94BD),
              ],
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/subject');
            },
            child: SizedBox(
              width: 120,
              height: 120,
              child: Center(
                child: Text(
                  "$grade",
                  style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            splashColor: Colors.blue.withAlpha(40),
          ),
        ),
      ),
    );
  }
}
