import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(12.0)),
          const Center(
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12), // Added padding for text field
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for the desired topic',
                        border: InputBorder.none, // Removed default border
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.black),
                ],
              ),
            ),
          ),
           Container(
            margin: EdgeInsets.only(top: 25),
             child: const Text(
               "Choose Your Class",
               style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 30,
                   color: Colors.white),
             ),
           ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Card(
                  elevation: 20,
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 6,
                          offset: const Offset(-6.0, 6.00),
                        ),
                      ],
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF0f5288), // First color with opacity
                          Color(0xFF5A94BD),
                        ],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Center(
                          child: Text(
                            "11",
                            style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      splashColor: Colors.blue.withAlpha(40),
                    ),
                  ),
                ),
              ),
      
            ],
          )
        ],
      ),
    );
  }
}
