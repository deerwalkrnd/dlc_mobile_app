// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more/widgets/instructorcard.dart';
import 'package:dlc/services/api_service.dart';
import 'package:dlc/models/instructors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class InstructorsPage extends StatefulWidget {
  const InstructorsPage({super.key});

  @override
  State<InstructorsPage> createState() => _InstructorsPageState();
}

class _InstructorsPageState extends State<InstructorsPage> {

  Future<List<Instructor>>? _futureInstructors;



  @override
  void initState() {
    super.initState();
    _futureInstructors = ApiService().fetchInstructors();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Scaffold(

        body: _futureInstructors == null
            ? const Center(child: Text("Error loading instructors"))
            : FutureBuilder<List<Instructor>>(
          future: _futureInstructors,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No instructors found.'));
            } else {
              final instructors = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.instructors,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: _buildRows(instructors),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),

      ),
    );
  }

  List<Widget> _buildRows(List<Instructor> instructors) {
    return List.generate(
      (instructors.length / 2).ceil(),
          (index) {
        final start = index * 2;
        final end = (index * 2 + 2).clamp(0, instructors.length);
        return _buildRow(instructors.sublist(start, end));
      },
    );
  }

  Widget _buildRow(List<Instructor> instructors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: instructors.map((instructor) {
        return Expanded(
          child: InstructorCard(
              imagePath: instructor.imageUrl,
              name: instructor.name,
              messageUrl: 'mailto:${instructor.email}',
              phoneUrl: 'tel:${instructor.contact}', linkedInUrl: 's',
              nepaliName: instructor.nepaliName
          ),
        );
      }).toList(),
    );
  }
}