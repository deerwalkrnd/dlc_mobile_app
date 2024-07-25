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
      throw Exception('Error fetching grades: $e');

}
}
  Future<List<Grade_Subject>> fetchGradeSubjects(int gradeId) async {
    try {
      final url = '$baseUrl/grades/$gradeId/subjects';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

        if (!jsonData.containsKey('data')) {
          throw Exception('Key "data" not found in response');
        }

        final subjectsList = jsonData['data'] as List<dynamic>;

        final subjects = subjectsList.map((subjectJson) {
          final subjectData = subjectJson as Map<String, dynamic>;

          final gradeSubject = Grade_Subject.fromJson(subjectData);

          return gradeSubject;
        }).toList();

        return subjects;
      } else {
        throw Exception(
            'Failed to load grade subjects: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching grade subjects: $e');
    }
  }

  Future<ApiResponse> fetchUnits(int mainGradeID) async {
    final response = await http.get(Uri.parse('https://dlc-dev.deerwalk.edu.np/api/subjects/$mainGradeID/unit'));

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
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> instructorList = jsonData['data'];
        final instructors = instructorList.map((data) => Instructor.fromJson(data as Map<String, dynamic>)).toList();
        return instructors;
      } else {
        throw Exception('Failed to load instructors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching instructors: $e');
    }
  }
}

