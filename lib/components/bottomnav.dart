import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/updates.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.25, color: Colors.white),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: oneBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'More',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.more_horiz_outlined),
          //   label: 'terms',
          // )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 2) {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MorePage()),
            );
          } else if(index == 0) {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else{
            onItemTapped(index);
          }
        },
      ),
    );
  }
}
