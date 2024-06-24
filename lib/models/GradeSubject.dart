// ignore_for_file: unused_import

import 'dart:convert';

// Define the GradeSubject class
class GradeSubject {
  final int id;
  final String subjectName;
  final String subjectImage;

  GradeSubject({
    required this.id,
    required this.subjectName,
    required this.subjectImage,
  });

  factory GradeSubject.fromJson(Map<String, dynamic> json) {
    return GradeSubject(
      id: json['id'],
      subjectName: json['subject_name'],
      subjectImage: json['subject_image'],
    );
  }
}

// Define the Unit class
class Unittwo {
  final int id;
  final GradeSubject gradeSubject;
  String name;
  final String nepaliName;
  final int unitNumber;

  Unittwo({
    required this.id,
    required this.gradeSubject,
    required this.name,
    required this.nepaliName,
    required this.unitNumber,
  });

  factory Unittwo.fromJson(Map<String, dynamic> json) {
    return Unittwo(
      id: json['id'],
      gradeSubject: GradeSubject.fromJson(json['grade_subject']),
      name: json['name'],
      nepaliName: json['nepali_name'],
      unitNumber: json['unit_number'],
    );
  }
}

// Define the ApiResponse class
class ApiResponse {
  final List<Unittwo> data;

  ApiResponse({
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Unittwo> unitsList = list.map((i) => Unittwo.fromJson(i)).toList();
    return ApiResponse(data: unitsList);
  }
}
