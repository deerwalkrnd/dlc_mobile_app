import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/GradeSubject.dart';

class UnitCard extends StatefulWidget {
  final Unittwo unit;
  final String subjectName;
  final int unitId;
  final String searchQuery;
  final String selectedLanguage;
  final void Function(String title, String url) onVideoSelected;

  const UnitCard({
    super.key,
    required this.unit,
    required this.subjectName,
    required this.unitId,
    required this.searchQuery,
    required this.selectedLanguage,
    required this.onVideoSelected,
  });

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {
  bool _isExpanded = false;
  List<dynamic> _chapters = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.searchQuery.isNotEmpty) {
      _fetchChapters(expand: true);
    }
  }

  void _toggleExpand() {
    if (!_isExpanded) {
      _fetchChapters(expand: true);
    } else {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  Future<void> _fetchChapters({bool expand = false}) async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://dlc-dev.deerwalk.edu.np/api/units/${widget.unitId}/chapter'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _chapters = data['data'];
        _isExpanded = expand ? true : _isExpanded;
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
    if (widget.searchQuery.isEmpty) {
      return _chapters;
    } else {
      return _chapters.where((chapter) {
        String title = widget.selectedLanguage == 'Nepali'
            ? chapter['title_nepali']
            : chapter['title'];
        return title.toLowerCase().contains(widget.searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredChapters = filterChapters();
    if (widget.searchQuery.isNotEmpty && filteredChapters.isEmpty) {
      return const SizedBox.shrink();
    }

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
                        widget.selectedLanguage == 'Nepali'
                            ? widget.unit.nepaliName
                            : widget.unit.name,
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
                  child: filteredChapters.isEmpty
                      ? const Center(
                    child: Text(
                      'No chapters found',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                      : Column(
                    children: filteredChapters.asMap().entries.map((entry) {
                      int index = entry.key;
                      dynamic chapter = entry.value;
                      return _buildChapterItem(index, chapter);
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChapterItem(int index, dynamic chapter) {
    String chapterTitle = '${widget.unit.unitNumber}.${index + 1} '
        '${widget.selectedLanguage == 'Nepali' ? chapter['title_nepali'] : chapter['title']}';
    String videoUrl = chapter['url'];
    print(videoUrl);

    return ListTile(
      title: RichText(
        text: _highlightSearchQuery(chapterTitle),
      ),
      onTap: () {
        widget.onVideoSelected(chapterTitle, videoUrl);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  TextSpan _highlightSearchQuery(String text) {
    if (widget.searchQuery.isEmpty) {
      return TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      );
    } else {
      List<TextSpan> spans = [];
      int start = 0;
      int index;

      String lowerCaseText = text.toLowerCase();
      String lowerCaseQuery = widget.searchQuery.toLowerCase();

      while ((index = lowerCaseText.indexOf(lowerCaseQuery, start)) != -1) {
        if (index > start) {
          spans.add(TextSpan(
            text: text.substring(start, index),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ));
        }

        spans.add(TextSpan(
          text: text.substring(index, index + lowerCaseQuery.length),
          style: const TextStyle(
            fontSize: 16,
            backgroundColor: Colors.yellow,
          ),
        ));

        start = index + lowerCaseQuery.length;
      }

      if (start < text.length) {
        spans.add(TextSpan(
          text: text.substring(start),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ));
      }

      return TextSpan(children: spans);
    }
  }
}
