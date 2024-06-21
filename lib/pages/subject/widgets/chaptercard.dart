import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../yt.dart';
import '../../../models/GradeSubject.dart';
// ignore: unused_import
import '../../../models/unit.dart';

// ignore: must_be_immutable
class UnitCard extends StatefulWidget {
  final Unittwo unit;

  var subject_name;
  UnitCard({super.key, required this.unit, required this.subject_name});

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {

  bool _isExpanded = false;
  List<dynamic> _topics = [];
  bool _isLoading = false;

  void _toggleExpand() {
    if (!_isExpanded) {
      _fetchTopics();
    } else {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  Future<void> _fetchTopics() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://dlc-dev.deerwalk.edu.np/api/units/{$widget.unit}/chapter'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _topics = data['data'];
        _isExpanded = true;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load topics');
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
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isLoading) CircularProgressIndicator(),
              if (_isExpanded && !_isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: _topics.asMap().entries.map((entry) {
                      int index = entry.key;
                      dynamic topic = entry.value;
                      return _buildTopicItem(index, topic);
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopicItem(int index, dynamic topic) {
    return ListTile(
      title: Text(
        '${widget.unit.unitNumber}.${index + 1} ${topic['title']}',
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
              title: topic['title'],
              url: topic['url'],
              sub_name_final:widget.subject_name
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
