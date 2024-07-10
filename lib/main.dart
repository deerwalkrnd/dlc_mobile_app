
import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:dlc/models/dropdown_state.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/localeModifier.dart';
import 'package:dlc/routers.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DropdownState()),
        ChangeNotifierProvider(create: (_) => LocaleNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeNotifier = Provider.of<LocaleNotifier>(context);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: oneBlue),
      locale: localeNotifier.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,

    );
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ne'),
  ];
}
