import 'package:flutter/material.dart';


class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
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
          subjectContainer(
            imagePath: "assets/images/subjects/maths.jpg",
            subjectName: 'Mathematics',
          ),
          subjectContainer(
            imagePath: "assets/images/subjects/phy.jpg",
            subjectName: 'Science',
          ),
          subjectContainer(
            imagePath: "assets/images/subjects/eng.jpg",
            subjectName: 'English',
          ),
        ],
      ),
      ),
    );
  }

Widget subjectContainer({required String imagePath, required String subjectName}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(0.35),
            border: Border.all(color: Colors.white, width: 0.25),
          ),
          padding: EdgeInsets.fromLTRB(10,10,10,5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 250,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Text(
                subjectName,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5))
            ],
          ),
        ),
      ),
    );
  }
}