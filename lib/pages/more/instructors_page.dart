import 'package:flutter/material.dart';

class InstructorsPage extends StatelessWidget {
  const InstructorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Instructor> instructors = [
      Instructor(imagePath: "assets/images/instructors/1.png", name: 'Aakash Chandra Giri'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
      Instructor(imagePath: "assets/images/instructors/2.png", name: 'Aakancha Thapa'),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Instructors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: _buildRows(instructors),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRows(List<Instructor> instructors) {
    List<Widget> rows = [];
    List<Instructor> currentRow = [];

    for (var instructor in instructors) {
      currentRow.add(instructor);

      if (currentRow.length == 2 || instructor == instructors.last) {
        rows.add(_buildRow(currentRow));
        currentRow = [];
      }
    }

    return rows;
  }

  Widget _buildRow(List<Instructor> instructors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: instructors.map((instructor) {
        return InstructorCard(
          imagePath: instructor.imagePath,
          name: instructor.name,
        );
      }).toList(),
    );
  }
}

class Instructor {
  final String imagePath;
  final String name;

  const Instructor({
    required this.imagePath,
    required this.name,
  });
}

class InstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const InstructorCard({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          IconRow(),
          Padding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/instructors/icons/1.png"),
        SizedBox(width: 10),
        Image.asset("assets/images/instructors/icons/2.png"),
        SizedBox(width: 10),
        Image.asset("assets/images/instructors/icons/3.png"),
      ],
    );
  }
}
