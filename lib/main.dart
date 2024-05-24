import 'package:dlc/pages/subject/subject.dart';
import 'package:flutter/material.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/unit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const Color customColor = Color(0xFF0F5288);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Deerwalk Learning Center';
    return MaterialApp(
      routes: {
        
        '/subject':(context) => SubjectPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: customColor,
      ),
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const MyHomePage(),
    );
  }
}
