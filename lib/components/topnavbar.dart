import 'package:dlc/main.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: MyApp.customColor,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'assets/images/deerwalklearning.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              onTap: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
              },
            ),
            SizedBox(width: 8),
            Spacer(),
            SizedBox(
              height: 30, 
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
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