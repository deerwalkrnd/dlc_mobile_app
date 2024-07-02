import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more/flipped_class_page.dart';
import 'package:dlc/pages/more/instructors_page.dart';
import 'package:dlc/pages/more/press_release_page.dart';
import 'package:dlc/pages/more/terms_of_use_page.dart';
import 'package:dlc/pages/more/widgets/morecard.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
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
      appBar: const TopNavBar(),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Text(AppLocalizations.of(context)!.more, style: AppTextStyles.headline600),
          ),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            runSpacing: 4, //4 multiple better
            children: [
              MoreCard(
                imagePath: "assets/images/more/flipped.png",
                title:  AppLocalizations.of(context)!.flippedTitle,
                navigateTo: const FlippedClassPage(),
              ),
              MoreCard(
                imagePath: "assets/images/more/instructor.png",
                title: AppLocalizations.of(context)!.instructors,
                navigateTo: const InstructorsPage(),
              ),
              MoreCard(
                imagePath: "assets/images/more/press.png",
                title: AppLocalizations.of(context)!.pressTitle,
                navigateTo: const PressReleasePage(),
              ),
              MoreCard(
                imagePath: "assets/images/more/terms.png",
                title: AppLocalizations.of(context)!.termsOfUseTitle,
                navigateTo: const TermsOfUsePage(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
