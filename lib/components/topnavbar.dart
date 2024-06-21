import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/main.dart';
import 'package:dlc/models/dropdown_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dropdownState = Provider.of<DropdownState>(context);

    final List<String> items = ['Nepali', 'English'];

    return Container(

      decoration: const BoxDecoration(
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
        backgroundColor: oneBlue,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  constraints:
                      const BoxConstraints(maxHeight: 150, maxWidth: 160),
                  child: Image.asset(
                    'assets/images/deerwalklearning.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    value: dropdownState.value, // Use dropdownState.value
                    iconSize: 0,
                    dropdownColor: oneBlue,
                    style: const TextStyle(color: Colors.white),
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      dropdownState.value = newValue!;
                      AppLocalizations.of(context)!.test;

                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
