import 'package:flutter/material.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more/widgets/instructorcard.dart';
import 'package:dlc/services/api_service.dart';
import 'package:dlc/models/instructors.dart';

class InstructorsPage extends StatefulWidget {
  const InstructorsPage({super.key});

  @override
  State<InstructorsPage> createState() => _InstructorsPageState();
}

class _InstructorsPageState extends State<InstructorsPage> {
  int _selectedIndex = 0;
  Future<List<Instructor>>? _futureInstructors;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UpdatesPage(),
    MorePage(),
  ];

  @override
  void initState() {
    super.initState();
    _futureInstructors = ApiService().fetchInstructors();
  }

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
      body: _futureInstructors == null
          ? const Center(child: Text("Error loading instructors"))
          : FutureBuilder<List<Instructor>>(
        future: _futureInstructors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No instructors found.'));
          } else {
            final instructors = snapshot.data!;
            return SingleChildScrollView(
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
          imagePath: instructor.imageUrl,
          name: instructor.name,
          messageUrl: 'mailto:${instructor.email}',
          phoneUrl: 'tel:${instructor.contact}',
          // linkedInUrl: instructor.linkedin_url ?? '',
        );
      }).toList(),
    );
  }
}
