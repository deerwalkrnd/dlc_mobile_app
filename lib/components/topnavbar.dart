import 'package:dlc/main.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/models/dropdown_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar();

  @override
  Widget build(BuildContext context) {
    final dropdownState = Provider.of<DropdownState>(context); 

    final List<String> items=['Nepali','English'];

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
              onTap: () {
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
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    value: dropdownState.value, // Use dropdownState.value
                    iconSize: 0,
                    dropdownColor: MyApp.customColor,
                    style: TextStyle(color: Colors.white),
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      dropdownState.value = newValue!;
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

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
