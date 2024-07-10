import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/services/api_service.dart';
import 'package:dlc/models/grade.dart';
import 'package:dlc/pages/subject/subject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List _widgetOptions = [
    HomeWidget(),
    UpdatesPage(),
    MorePage(),
  ];
  static const List<String> routesPage= <String>[
    "/","/updates","more"
  ];

  void _onItemTapped(int index) {

    setState(() {

      _selectedIndex = index;
    });
    if (index == 0) {
      (){};

    }else {
      context.go(routesPage[index]);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavBar(),
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
  final TextEditingController _searchController = TextEditingController();
  late Future<List<Grade>> futureGrades;
  List<Grade> filteredGrades = [];

  @override
  void initState() {
    super.initState();
    futureGrades = ApiService().fetchGrades();
    futureGrades.then((grades) {
      setState(() {
        filteredGrades = grades;
      });
    });
  }

  void _filterGrades(String query) {
    setState(() {
      if (query.isEmpty) {
        futureGrades.then((grades) {
          filteredGrades = grades;
        });
      } else {
        futureGrades.then((grades) {
          filteredGrades = grades
              .where((grade) => grade.grades.toString().contains(query))
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(12.0)),
          Center(
            child: Text(
              AppLocalizations.of(context)!.whatClassJoin,
              style: const TextStyle(
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
                      // controller: _searchController,
                      decoration:  InputDecoration(
                        hintText: AppLocalizations.of(context)!.hint,
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
            child: Text(
              AppLocalizations.of(context)!.chooseYourClass,
              style: const TextStyle(
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
                  children:
                      grades.map((grade) => GradeCard(grade: grade)).toList(),
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

  const GradeCard({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    // Get localized grade
    String displayGrade = _getLocalizedGrade(context, grade.grades);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
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
                    builder: (context) =>
                        SubjectPage(id: grade.id, grade: displayGrade)),
              );
              // context.go( Uri(path:"/subjects/${grade.id}", queryParameters: {'displayGrade': displayGrade}).toString());
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

  String _getLocalizedGrade(BuildContext context, int grade) {
    switch (grade) {
      case 1:
        return AppLocalizations.of(context)!.grade_1;
      case 2:
        return AppLocalizations.of(context)!.grade_2;
      case 3:
        return AppLocalizations.of(context)!.grade_3;
      case 4:
        return AppLocalizations.of(context)!.grade_4;
      case 5:
        return AppLocalizations.of(context)!.grade_5;
      case 6:
        return AppLocalizations.of(context)!.grade_6;
      case 7:
        return AppLocalizations.of(context)!.grade_7;
      case 8:
        return AppLocalizations.of(context)!.grade_8;
      case 9:
        return AppLocalizations.of(context)!.grade_9;
      case 10:
        return AppLocalizations.of(context)!.grade_10;
      case 11:
        return AppLocalizations.of(context)!.grade_11;
      default:
        return grade.toString();
    }
  }
}
