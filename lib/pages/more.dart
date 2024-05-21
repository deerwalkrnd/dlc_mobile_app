import 'package:dlc/pages/press_release_page.dart';
import 'package:flutter/material.dart';
import 'package:dlc/pages/flipped_class_page.dart';
import 'package:dlc/pages/instructors_page.dart';
import 'package:dlc/pages/press_release_page.dart';
import 'package:dlc/pages/terms_of_use_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
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
                          "assets/images/more/flipped.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "Flipped Class",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlippedClassPage()),
                    );
                  },
                ),
              ),
              Padding(
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
                          "assets/images/more/instructor.png",
                          width: 40,
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "Instructors",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InstructorsPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                          "assets/images/more/press.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "Press Release",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PressReleasePage()),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Center(
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
                                "assets/images/more/terms.png",
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  "Terms of Use",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TermsOfUsePage()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
