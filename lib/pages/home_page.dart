import 'package:dlc/models/grade.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return DefaultLayout(
        body: SingleChildScrollView(
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
                      decoration: InputDecoration(
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
    ));
  }
}
