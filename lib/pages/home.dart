import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(12)),
            Center(
              child: Text(
                'Choose Your Subject',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              
            )
          ],
        ),
    );
  }
}
