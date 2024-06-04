import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/grade.dart';

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

}