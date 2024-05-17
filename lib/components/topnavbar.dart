import 'package:dlc/main.dart';
import 'package:flutter/material.dart';

class TopNavBar extends StatefulWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  TopNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  _TopNavBarState createState() => _TopNavBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopNavBarState extends State<TopNavBar> {
  String dropdownValue = 'Nepali';

  var items = [
    'Nepali',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 0,
            offset: Offset(0, 0.1),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: MyApp.customColor,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/deerwalklearning.png',
              width: 150,
              
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Spacer(),
            SizedBox(
              height: 30, // Adjust vertical margin as needed
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0), // Adjust horizontal margin as needed
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                    value: dropdownValue,
                    icon: null,
                    iconSize: 0,
                    dropdownColor: MyApp.customColor,
                     // Background color of the dropdown
                    style: TextStyle(color: Colors.white), // Text color of dropdown items
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}