import 'dart:convert';
import 'package:dlc/models/grade_subject.dart';
import 'package:dlc/models/unit.dart';
import 'package:http/http.dart' as http;
import '../models/grade.dart';
import '../models/instructors.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<Grade>> fetchGrades() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/grade'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      final grades = jsonData.entries.map((entry) => Grade.fromJson(entry.value)).toList();
      return grades;
    } else {
      throw Exception('Failed to load grades: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching grades: $e');
    throw Exception('Error fetching grades: $e');
  }
}
Future<List<Grade_Subject>> fetchGradeSubjects(String grade) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/grade_subject/${grade}'));
    print('Request URL: $baseUrl/grade_subject/${grade}');
    
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      print('Response JSON: $jsonData');
      
      final subjectsMap = jsonData['Grade_${grade}'] as Map<String, dynamic>;
      print('Subjects Map: $subjectsMap');
      
      final subjects = subjectsMap.entries.map((entry) {
        final subjectData = entry.value as Map<String, dynamic>;
        print('Subject Data: $subjectData');
        
        final gradeSubject = Grade_Subject.fromJson(subjectData);
        print('Grade_Subject: $gradeSubject');
        
        return gradeSubject;
      }).toList();
      
      print('Subjects List: $subjects');
      return subjects;
    } else {
      throw Exception('Failed to load grade subjects: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Error fetching grade subjects: $e');
  }
}

Future<List<Unit>> fetchUnit(int gradeSubjectId) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/unit/$gradeSubjectId'));
    print('$baseUrl/unit/$gradeSubjectId');
    
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print('Response JSON: $jsonResponse');
      
      if (jsonResponse['Subject$gradeSubjectId'] == null) {
        throw Exception('Error fetching units: null response');
      }
      
      final unitsJson = jsonResponse['Subject$gradeSubjectId'] as Map<String, dynamic>;
      print('Units JSON: $unitsJson');
      
      final units = unitsJson.entries.map((entry) {
        final unitData = entry.value as Map<String, dynamic>;
        print('Unit Data: $unitData');
        
        final unit = Unit.fromJson(unitData);
        print('Unit: $unit');
        
        return unit;
      }).toList();
      
      print('Units List: $units');
      return units;
    } else {
      throw Exception('Failed to load units: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Error fetching units: $e');
  }
}


Future<List<Instructor>> fetchInstructors() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/instructor'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      final instructors = jsonData.entries.map((entry) {
        final instructorData = entry.value as Map<String, dynamic>;
        return Instructor.fromJson(instructorData);
      }).toList();
      return instructors;
    } else {
      throw Exception('Failed to load instructors: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching instructors: $e');
    throw Exception('Error fetching instructors: $e');
  }
}

}