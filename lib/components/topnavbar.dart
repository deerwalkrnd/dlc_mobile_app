import 'package:dlc/main.dart';
import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final List<String> items = [
    'Nepali',
    'English',
  ];
  final ValueChanged<int> onItemTapped;

  TopNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white, // White shadow color
            spreadRadius: 0,
            offset: Offset(0, 0.25), // Offset to simulate the shadow
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: MyApp.customColor,
        elevation: 0, // Set elevation to 0 to avoid default shadow
        title: Row(
          children: [
            Image.asset(
              'assets/images/deerwalklearning.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
          ],
          
        ),
      ),
    );
  }
}
