import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/subject/widgets/subjectcard.dart';
import 'package:dlc/services/api_service.dart';
import 'package:dlc/models/grade_subject.dart';

class SubjectPage extends StatefulWidget {
  final String grade;
  final int id; // Change to int

  const SubjectPage({super.key, required this.grade, required this.id});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  int _selectedIndex = 0;
  late Future<List<Grade_Subject>> futureSubjects;

  @override
  void initState() {
    super.initState();
    futureSubjects = ApiService().fetchGradeSubjects(widget.id); // Pass id here
  }

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
      appBar: const TopNavBar(),
      body: FutureBuilder<List<Grade_Subject>>(
        future: futureSubjects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No subjects found.'));
          } else {
            final subjects = snapshot.data!;
            return SingleChildScrollView(
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
                  ...subjects.map((subject) => SubjectCard(
                    imagePath: subject.subjectImageUrl,
                    subjectName: subject.subjectName,
                    subjectId: subject.id,
                    mainId: widget.id
                  )),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
