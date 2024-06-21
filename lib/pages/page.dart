// import 'dart:convert';
// import 'package:dlc/constants.dart/constants.dart';
// import 'package:dlc/pages/subject/widgets/chaptercard.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/GradeSubject.dart';
// import 'package:dlc/components/bottomnav.dart';
// import 'package:dlc/components/topnavbar.dart';
// import 'package:dlc/pages/updates.dart';
// import 'package:dlc/pages/home.dart';
// import 'package:dlc/pages/more.dart';

// class UnitPage extends StatefulWidget {
//   final String subjectName;
//   final int gradeSubjectId;

//   const UnitPage({
//     Key? key,
//     required this.subjectName,
//     required this.gradeSubjectId,
//   }) : super(key: key);

//   @override
//   State<UnitPage> createState() => _UnitPageState();
// }

// class _UnitPageState extends State<UnitPage> {
//   var subName;
//   int _selectedIndex = 0;
//   late Future<List<Unittwo>> futureUnits;

//   static const List<Widget> _widgetOptions = <Widget>[
//     HomePage(),
//     UpdatesPage(),
//     MorePage(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     futureUnits = fetchUnits();
//     subName = widget.subjectName;
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index);
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => _widgetOptions[index]),
//     );
//   }

//   Future<List<Unittwo>> fetchUnits() async {
//     final response = await http.get(Uri.parse(
//         'https://dlc-dev.deerwalk.edu.np/api/subjects/${widget.gradeSubjectId}/unit'));

//     if (response.statusCode == 200) {
//       ApiResponse apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
//       return apiResponse.data;
//     } else {
//       throw Exception('Failed to load units');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TopNavBar(),

//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const BackButton(
//                   color: Colors.white,
//                 ),
//                 Text(
//                   '$subName',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 24,
//                       color: Colors.white
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(32),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 child: const Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: null,
//                         decoration: InputDecoration(
//                           hintText: 'Search for the desired topic',
//                           border: InputBorder.none,
//                         ),
//                         onChanged: null,
//                       ),
//                     ),
//                     Icon(Icons.search, color: Colors.black),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Center(
//                 child: FutureBuilder<List<Unittwo>>(
//                   future: futureUnits,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (snapshot.hasData) {
//                       List<Unittwo> units = snapshot.data!;
//                       return Column(
//                         children: units.map((unit) {
//                           return UnitCard(
//                             subjectName: subName,
//                             unit: unit,
//                             unitId: unit.id,
//                           );
//                         }).toList(),
//                       );
//                     } else {
//                       return const Center(child: Text('No data found'));
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }
