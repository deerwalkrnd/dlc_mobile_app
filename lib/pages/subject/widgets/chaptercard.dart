import 'package:flutter/material.dart';
import 'package:dlc/pages/subject/chaptersone.dart';

class ChapterCard extends StatefulWidget {
  final int chapter;

  const ChapterCard({super.key, required this.chapter});

  @override
  _ChapterCardState createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  bool _isExpanded = false;

  final List<Map<String, String>> sections = [
    {'number': '1.1', 'title': 'Qualities & Dimensional Analysis'},
    {'number': '1.2', 'title': 'Unit Conversion & Measurement'},
    {'number': '1.3', 'title': 'Fundamental Units & Derived Units'},
    {'number': '1.4', 'title': 'Measurement Techniques'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0f5288),
                Color(0xFF5A94BD),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFA5D6F2),
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    children: [
                      Text(
                        "Unit ${widget.chapter}",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Unit and Dimension",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isExpanded)
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white.withOpacity(0.5)),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: sections.map((section) {
                        return GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                '${section['number']}.  ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                section['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChapterOnePage()),
                          );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
      ),
    );
  }
}
