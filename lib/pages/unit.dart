import 'dart:convert';

import 'package:dlc/components/youtube_player_container.dart';
// ignore: unused_import
import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/models/GradeSubject.dart';
import 'package:dlc/models/dropdown_state.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/subject/widgets/chaptercard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UnitPage extends StatefulWidget {
  final String subjectName;
  final int gradeSubjectId;

  const UnitPage({
    super.key,
    required this.subjectName,
    required this.gradeSubjectId,
  });

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  bool newPage = true;
  dynamic subName;
  int _selectedIndex = 0;
  late Future<List<Unittwo>> futureUnits;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  String selectedLanguage = 'English';
  String? selectedVideoTitle;
  String? selectedVideoUrl;
  final YoutubePlayerController _youtubeController = YoutubePlayerController(
      initialVideoId: '', flags: const YoutubePlayerFlags(autoPlay: false));
  bool isNewSelected = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedLanguage = Provider.of<DropdownState>(context, listen: false).value;
    futureUnits = fetchUnits(selectedLanguage);
    subName = widget.subjectName;

    Provider.of<DropdownState>(context, listen: false)
        .addListener(_updateLanguage);
  }

  void _updateLanguage() {
    setState(() {
      selectedLanguage =
          Provider.of<DropdownState>(context, listen: false).value;
      futureUnits = fetchUnits(selectedLanguage);
    });
  }

  Future<List<Unittwo>> fetchUnits(String language) async {
    final apiUrl = newPage
        ? 'https://dlc-dev.deerwalk.edu.np/api/new/subjects/${widget.gradeSubjectId}/unit'
        : 'https://dlc-dev.deerwalk.edu.np/api/subjects/${widget.gradeSubjectId}/unit';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      ApiResponse apiResponse =
          ApiResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      List<Unittwo> units = apiResponse.data;

      units = units.map((unit) {
        if (language == 'Nepali') {
          unit.name = unit.nepaliName;
          for (var chapter in unit.chapters) {
            chapter.title = chapter.titleNepali.isNotEmpty
                ? chapter.titleNepali
                : chapter.title;
          }
        }
        return unit;
      }).toList();

      units.sort((a, b) => a.unitNumber.compareTo(b.unitNumber));

      return units;
    } else {
      throw Exception('Failed to load units');
    }
  }

  Future<List<Unittwo>> searchUnitsWithChapters() async {
    final response = await http.get(Uri.parse(
        'https://dlc-dev.deerwalk.edu.np/api/search-chapters?query=$searchQuery&subject_id=${widget.gradeSubjectId}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      Map<int, List<dynamic>> unitChaptersMap = {};

      for (var chapter in data['data']) {
        var unitId = chapter['unit']['id'];
        if (!unitChaptersMap.containsKey(unitId)) {
          unitChaptersMap[unitId] = [];
        }
        unitChaptersMap[unitId]!.add(chapter);
      }

      final responseUnits = await fetchUnits(selectedLanguage);
      return responseUnits
          .where((unit) => unitChaptersMap.containsKey(unit.id))
          .toList();
    } else {
      throw Exception('Failed to search chapters');
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    Provider.of<DropdownState>(context, listen: false)
        .removeListener(_updateLanguage);
    _youtubeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _selectVideo(String title, String url) async {
    setState(() {
      selectedVideoTitle = title;
      selectedVideoUrl = url;
    });

    _youtubeController.load(YoutubePlayer.convertUrlToId(url)!);

    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubeController,
        onReady: () {
          _youtubeController
              .load(YoutubePlayer.convertUrlToId(selectedVideoUrl ?? '')!);
          _youtubeController.play();
        },
      ),
      builder: (context, player) {
        return DefaultLayout(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Row(
                  children: [
                    const BackButton(
                      color: Colors.white,
                    ),
                    Text(
                      whichSubjectLocalize(subName),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.hinttwo,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            newPage = true;
                            futureUnits = fetchUnits(selectedLanguage);
                            isNewSelected = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 90,
                          decoration: BoxDecoration(
                            color: isNewSelected
                                ? Colors.white
                                : const Color(0xFF0f5288),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFA5D6F2),
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.naya,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color:
                                    isNewSelected ? Colors.blue : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            newPage = false;
                            futureUnits = fetchUnits(selectedLanguage);
                            isNewSelected = false;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 90,
                          decoration: BoxDecoration(
                            color: isNewSelected
                                ? const Color(0xFF0f5288)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFA5D6F2),
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.old,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color:
                                    isNewSelected ? Colors.white : Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                if (selectedVideoTitle != null && selectedVideoUrl != null)
                  YoutubePlayerContainer(
                      player: player,
                      controller: _youtubeController,
                      selectedVideoTitle: selectedVideoTitle ?? ''),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder<List<Unittwo>>(
                    future: searchQuery.isEmpty
                        ? futureUnits
                        : searchUnitsWithChapters(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<Unittwo> units = snapshot.data!;

                        if (units.isEmpty) {
                          return const Center(
                            child: Text('No units found',
                                style: TextStyle(color: Colors.white)),
                          );
                        }

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: units.length,
                          itemBuilder: (context, index) {
                            return UnitCard(
                              subjectName: subName,
                              unit: units[index],
                              unitId: units[index].id,
                              selectedLanguage: selectedLanguage,
                              searchQuery: searchQuery,
                              onVideoSelected: _selectVideo,
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No data found'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String whichSubjectLocalize(subName) {
    switch (subName) {
      case 'Science':
        return AppLocalizations.of(context)!.subject_science;

      case 'Mathematics':
        return AppLocalizations.of(context)!.subject_mathematics;
      case 'English':
        return AppLocalizations.of(context)!.subject_english;
      case 'Nepali':
        return AppLocalizations.of(context)!.subject_nepali;
      case 'Social Studies':
        return AppLocalizations.of(context)!.subject_social_studies;
      case 'Physics':
        return AppLocalizations.of(context)!.subject_physics;
      case 'Chemistry':
        return AppLocalizations.of(context)!.subject_chemistry;
      case 'Zoology':
        return AppLocalizations.of(context)!.subject_zoology;
      default:
        return subName;
    }
  }
}
