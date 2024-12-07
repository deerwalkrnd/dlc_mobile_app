import 'package:flutter/material.dart';
import 'package:dlc/pages/unit.dart';

class SubjectCard extends StatelessWidget {
  final String imagePath;
  final String subjectName;
  final int subjectId;
  final int mainId;

  const SubjectCard({
    super.key,
    required this.imagePath,
    required this.subjectName,
    required this.subjectId,
    required this.mainId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.35),
              border: Border.all(color: Colors.white, width: 0.25),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://dlc-dev.deerwalk.edu.np/storage/images/subjects/$imagePath',
                    // imagePath


                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 5),
                Text(
                  subjectName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5))
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UnitPage(subjectName: subjectName, gradeSubjectId: subjectId)),
        );
      },
    );
  }
}
