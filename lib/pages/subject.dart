import 'package:flutter/material.dart';


class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(12)),
            Center(
              child: Text(
                'What topic do you want to learn?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
                    ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a'
              ),
            )
          ],
        ),
    );
  }
}