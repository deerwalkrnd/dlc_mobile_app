// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class GradeSubject {
//   final int id;
//   final String subjectName;
//   final String subjectImage;
//
//   GradeSubject({
//     required this.id,
//     required this.subjectName,
//     required this.subjectImage,
//   });
//
//   factory GradeSubject.fromJson(Map<String, dynamic> json) {
//     return GradeSubject(
//       id: json['id'] ?? 0,
//       subjectName: json['subject_name'] ?? '',
//       subjectImage: json['subject_image'] ?? '',
//     );
//   }
// }
//
// class Unit {
//   final int id;
//   final GradeSubject gradeSubject;
//   final String name;
//   final String nepaliName;
//   final int unitNumber;
//
//   Unit({
//     required this.id,
//     required this.gradeSubject,
//     required this.name,
//     required this.nepaliName,
//     required this.unitNumber,
//   });
//
//   factory Unit.fromJson(Map<String, dynamic> json) {
//     return Unit(
//       id: json['id'] ?? 0,
//       gradeSubject: GradeSubject.fromJson(json['grade_subject'] ?? {}),
//       name: json['name'] ?? '',
//       nepaliName: json['nepali_name'] ?? '',
//       unitNumber: json['unit_number'] ?? 0,
//     );
//   }
// }
//
// class ApiResponse {
//   final List<Unit> data;
//
//   ApiResponse({required this.data});
//
//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     var list = json['data'] as List;
//     List<Unit> dataList = list.map((i) => Unit.fromJson(i)).toList();
//     return ApiResponse(data: dataList);
//   }
// }
//
// Future<ApiResponse> fetchUnits() async {
//   final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
//
//   if (response.statusCode == 200) {
//     return ApiResponse.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load units');
//   }
// }
//
// class UnitListScreen extends StatefulWidget {
//   @override
//   _UnitListScreenState createState() => _UnitListScreenState();
// }
//
// class _UnitListScreenState extends State<UnitListScreen> {
//   late Future<ApiResponse> futureUnits;
//
//   @override
//   void initState() {
//     super.initState();
//     futureUnits = fetchUnits();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Units'),
//       ),
//       body: FutureBuilder<ApiResponse>(
//         future: futureUnits,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
//             return Center(child: Text('No units found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data?.data.length,
//               itemBuilder: (context, index) {
//                 final unit = snapshot.data?.data[index];
//                 return ListTile(
//                   title: Text(unit?.name ?? 'No name'),
//                   subtitle: Text(unit?.nepaliName ?? 'No nepali name'),
//                   leading: unit?.gradeSubject.subjectImage != null &&
//                           unit!.gradeSubject.subjectImage.isNotEmpty
//                       ? Image.asset(
//                           'assets/images/${unit.gradeSubject.subjectImage}')
//                       : Icon(Icons.image_not_supported),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
