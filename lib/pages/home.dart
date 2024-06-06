import 'package:dlc/pages/subject/subject.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/services/api_service.dart';
import 'package:dlc/models/grade.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
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
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController _searchController = TextEditingController();
  late Future<List<Grade>> futureGrades;
  List<Grade> filteredGrades = [];

  @override
  void initState() {
    super.initState();
    futureGrades = ApiService().fetchGrades();
  }

  void _filterGrades(String query) {
    futureGrades.then((grades) {
      setState(() {
        if (query.isEmpty) {
          filteredGrades = grades;
        } else {
          filteredGrades = grades
              .where((grade) =>
                  grade.grade.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(12.0)),
          const Center(
            child: Text(
              'What topic do you want to learn?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search for the desired topic',
                        border: InputBorder.none,
                      ),
                      onChanged: _filterGrades,
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.black),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: const Text(
              "Choose Your Class",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.white),
            ),
          ),
          FutureBuilder<List<Grade>>(
            future: futureGrades,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData) {
                return const Center(child: Text("No grades available"));
              } else {
                final grades =
                    filteredGrades.isEmpty ? snapshot.data! : filteredGrades;
                return Wrap(
                  spacing: 10.0, 
                  runSpacing: 10.0, 
                  children: grades.map((grade) => GradeCard(grade: grade)).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class GradeCard extends StatelessWidget {
  final Grade grade;

  const GradeCard({Key? key, required this.grade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayGrade =
        grade.grade.length >= 5 ? grade.grade.substring(6) : 'N/A';

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: 

         Container(
          width: 120,
          height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0f5288),
                    Color(0xFF5A94BD),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFA5D6F2),
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubjectPage(grade: displayGrade)),
                  );
                },
                child: SizedBox(
                  child: Center(
                    child: Text(
                      displayGrade,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
         
        
      ),
    );
  }
}
