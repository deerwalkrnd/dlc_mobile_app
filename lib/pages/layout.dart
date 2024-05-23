import 'package:dlc/pages/more/terms_of_use_page.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }
}
