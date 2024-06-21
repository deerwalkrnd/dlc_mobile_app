import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dlc/models/dropdown_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      locale: const Locale('es'),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      home: const HomePage(),
    );
  }
}