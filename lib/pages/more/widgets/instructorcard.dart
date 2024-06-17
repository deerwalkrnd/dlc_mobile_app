import 'package:flutter/material.dart';
import 'package:dlc/pages/more/widgets/iconrow.dart';

class InstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String messageUrl;
  final String phoneUrl;
  final String linkedInUrl;

  const InstructorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.messageUrl,
    required this.phoneUrl,
    required this.linkedInUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          IconRow(
            messageUrl: messageUrl,
            phoneUrl: phoneUrl,
            linkedInUrl: linkedInUrl,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }
}
