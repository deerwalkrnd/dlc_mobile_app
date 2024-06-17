import 'dart:convert';
import 'package:dlc/models/grade_subject.dart';
import 'package:http/http.dart' as http;
import '../models/GradeSubject.dart';
import '../models/grade.dart';
import '../models/instructors.dart';

class ApiService {
  final String baseUrl = 'https://dlc-dev.deerwalk.edu.np/api';

  Future<List<Grade>> fetchGrades() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/grades'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData =
            jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> gradesJson = jsonData['data'] as List<dynamic>;
        final grades = gradesJson.map((item) => Grade.fromJson(item)).toList();
        // Sort the grades in descending order
        grades.sort((a, b) => b.grades.compareTo(a.grades));
        return grades;
      } else {
        throw Exception('Failed to load grades: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching grades: $e');
      throw Exception('Error fetching grades: $e');
    }
  }

  Future<List<Grade_Subject>> fetchGradeSubjects(int gradeId) async {
    try {
      final url = '$baseUrl/grades/$gradeId/subjects';
      final response = await http.get(Uri.parse(url));
      print('Request URL: $url');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        print('Response JSON: $jsonData');

        if (!jsonData.containsKey('data')) {
          throw Exception('Key "data" not found in response');
        }

        final subjectsList = jsonData['data'] as List<dynamic>;
        print('Subjects List: $subjectsList');

        final subjects = subjectsList.map((subjectJson) {
          final subjectData = subjectJson as Map<String, dynamic>;
          print('Subject Data: $subjectData');

          final gradeSubject = Grade_Subject.fromJson(subjectData);
          print('Grade_Subject: $gradeSubject');

          return gradeSubject;
        }).toList();

        print('Subjects List: $subjects');
        return subjects;
      } else {
        print('Error: HTTP status ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception(
            'Failed to load grade subjects: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching grade subjects: $e');
      throw Exception('Error fetching grade subjects: $e');
    }
  }

  Future<ApiResponse> fetchUnits() async {
    final response = await http.get(Uri.parse('https://dlc-dev.deerwalk.edu.np/api/subjects/1/unit'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load units');
    }
  }

  Future<List<Instructor>> fetchInstructors() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/instructor'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final instructors = jsonData.map((data) => Instructor.fromJson(data as Map<String, dynamic>)).toList();
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
