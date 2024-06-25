import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../yt.dart';
import '../../../models/GradeSubject.dart';
import '../../../models/unit.dart';

class UnitCard extends StatefulWidget {
  final Unittwo unit;
  final String subjectName;
  final int unitId;

  UnitCard({
    Key? key,
    required this.unit,
    required this.subjectName,
    required this.unitId,
    required String searchQuery
  }) : super(key: key);

  @override
  State<UnitCard> createState() => _UnitCardState();
}
class _UnitCardState extends State<UnitCard> {
  bool _isExpanded = false;
  List<dynamic> _chapters = [];
  bool _isLoading = false;
  String searchQuery = '';

  void _toggleExpand() {
    if (!_isExpanded) {
      _fetchChapters();
    } else {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  Future<void> _fetchChapters() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://dlc-dev.deerwalk.edu.np/api/units/${widget.unitId}/chapter'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _chapters = data['data'];
        _isExpanded = true;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load chapters');
    }
  }

  List<dynamic> filterChapters() {
    if (searchQuery.isEmpty) {
      return _chapters;
    } else {
      return _chapters.where((chapter) {
        return chapter['title'].toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: _toggleExpand,
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
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    children: [
                      Text(
                        "Unit ${widget.unit.unitNumber}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.unit.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isLoading) const CircularProgressIndicator(),
              if (_isExpanded && !_isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: filterChapters().map((chapter) {
                      return _buildChapterItem(chapter);
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChapterItem(dynamic chapter) {
    return ListTile(
      title: Text(
        '${widget.unit.unitNumber}.${_chapters.indexOf(chapter) + 1} ${chapter['title']}',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FinalPage(
              unit: widget.unit,
              title: chapter['title'],
              url: chapter['url'],
              sub_name_final: widget.subjectName,
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
