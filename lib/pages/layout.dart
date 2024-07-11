// ignore_for_file: unused_field, unused_import

import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/models/grade.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/subject/subject.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;

  const DefaultLayout({super.key, required this.body});

  static const List<String> allRoutes = ['/', '/updates', '/more'];

  void _onItemTapped(BuildContext context, int index) {
    context.go(allRoutes[index]);
  }

  @override
  Widget build(BuildContext context) {
    print(allRoutes
        .indexOf(GoRouter.of(context).routeInformationProvider.value.uri.path));
    return Scaffold(
      appBar: const TopNavBar(),
      body: this.body,
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: allRoutes.indexOf(
            GoRouter.of(context).routeInformationProvider.value.uri.path),
        onItemTapped: (int index) => _onItemTapped(context, index),
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
