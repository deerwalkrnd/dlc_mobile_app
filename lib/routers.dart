// ignore_for_file: unused_import

import 'package:dlc/pages/home_page.dart';
import 'package:dlc/pages/layout.dart';

import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/more/flipped_class_page.dart';
import 'package:dlc/pages/more/instructors_page.dart';
import 'package:dlc/pages/more/press_release_page.dart';
import 'package:dlc/pages/more/terms_of_use_page.dart';
import 'package:dlc/pages/subject/subject.dart';
import 'package:dlc/pages/unit.dart';
import 'package:dlc/pages/updates.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'updates',
          builder: (BuildContext context, GoRouterState state) {
            return const UpdatesPage();
          },
        ),
        GoRoute(
          path: 'more',
          builder: (BuildContext context, GoRouterState state) {
            return MorePage();
          },
        ),

        GoRoute(
          path: 'subjects/:id',
          builder: (BuildContext context, GoRouterState state){
            String grade=state.uri.queryParameters['grade'] as String;
            int id=int.tryParse(state.pathParameters['id'] ?? "-1") ?? -1;
            return SubjectPage(
            grade:grade,
            id:id
          );
          }
        ),
        GoRoute(
          path: 'units/:subjectId',
          builder: (BuildContext context, GoRouterState state){
            String subjectName=state.uri.queryParameters['subjectName'] as String;
            int subjectId=int.tryParse(state.pathParameters['subjectId'] ?? "-1") ?? -1;
            return UnitPage(
            subjectName:subjectName,
            gradeSubjectId:subjectId
          );
          }
        ),
        GoRoute(
          path: 'flipped',
          builder: (BuildContext context, GoRouterState state){
            return const FlippedClassPage();
          }
        ),
        GoRoute(
          path: 'terms',
          builder: (BuildContext context, GoRouterState state){
            return const TermsOfUsePage();
          }
        ),
        GoRoute(
          path: 'instructor',
          builder: (BuildContext context, GoRouterState state){
            return const InstructorsPage();
          }
        ),
         GoRoute(
          path: 'press',
          builder: (BuildContext context, GoRouterState state){
            return const PressReleasePage();
          }
        ),
      ],
    ),
  ],
);
