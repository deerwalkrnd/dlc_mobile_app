import 'package:flutter/material.dart';
import 'package:dlc/pages/more/widgets/iconrow.dart';
import 'package:provider/provider.dart';

import '../../../models/dropdown_state.dart';

class InstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String messageUrl;
  final String phoneUrl;
  final String linkedInUrl;

  final String nepaliName;

  const InstructorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.messageUrl,
    required this.phoneUrl,
    required this.linkedInUrl,
    required this.nepaliName,
  });

  @override
  Widget build(BuildContext context) {
    final dropdownState = Provider.of<DropdownState>(context);
    final bool isNepali = dropdownState.value == 'Nepali';
    print(imagePath);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [

          Image.network(
            'https://dlc-dev.deerwalk.edu.np/storage/images/instructors/$imagePath',

            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            isNepali ? nepaliName : name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
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
