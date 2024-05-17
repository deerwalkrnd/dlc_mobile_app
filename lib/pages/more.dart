import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Center(
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
