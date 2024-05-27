import 'package:dlc/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';
import 'package:url_launcher/url_launcher.dart';

class ChapterOnePage extends StatefulWidget {
  static String videoID = 'egMWlD3fLJ8';
  const ChapterOnePage({super.key});

  @override
  State<ChapterOnePage> createState() => _ChapterOnePageState();
}

class _ChapterOnePageState extends State<ChapterOnePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UpdatesPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> chapters = [11, 10, 9, 8, 7, 6, 5, 4];

    return Scaffold(
      appBar:
          TopNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(12.0)),
            Stack(
              children: [
                
                   IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Text(
                      'Physics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for the desired topic',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '1.1   Quantities & Dimensional  Analysis',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  _launchURL(
                      'https://www.youtube.com/watch?v=${ChapterOnePage.videoID}');
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.youtube.com/vi/${ChapterOnePage.videoID}/0.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/youtube.png',
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: chapters
                  .map((chapter) => ChapterCard(chapter: chapter))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

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
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0f5288),
                Color(0xFF5A94BD),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
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
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
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
                    borderRadius: BorderRadius.only(
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
                        return Row(
                          children: [
                            Text(
                              '${section['number']}.  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              section['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
