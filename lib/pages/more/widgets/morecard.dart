import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget navigateTo;

  const MoreCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.navigateTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
      child: GestureDetector(
        child: Container(
          height: 110,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        },
      ),
    );
  }
}
