import 'dart:convert';
import 'package:dlc/models/grade_subject.dart';
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
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body); 
      print(jsonData); 
      
      // Accessing the grade data directly using the grade key
      final subjectsMap = jsonData['Grade_${grade}'] as Map<String, dynamic>;
      final subjects = subjectsMap.entries.map((entry) {
        final subjectData = entry.value as Map<String, dynamic>;
        return Grade_Subject.fromJson(subjectData);
      }).toList();
      
      return subjects;
    } else {
      throw Exception('Failed to load grade subjects: ${response.statusCode}');
    }
  } catch (e) {
    print('$e');
    throw Exception('Error fetching grade subjects: $e');
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