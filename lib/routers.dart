// ignore_for_file: unused_import

import 'package:dlc/pages/home_page.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/subject/subject.dart';
import 'package:dlc/pages/updates.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'updates',
          builder: (BuildContext context, GoRouterState state) {
          return   UpdatesPage();

          },
        ),
        GoRoute(
          path: 'more',
          builder: (BuildContext context, GoRouterState state) {
            return MorePage();

          },
        ),
      ],
    ),
  ],
);