import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dlc/models/dropdown_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DropdownState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Deerwalk Learning Center';
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: oneBlue,
      ),
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const HomePage(),
    );
  }
}
