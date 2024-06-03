import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  try {
    final response = await http.get(Uri.parse('$baseUrl/grade'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print('Grades: $jsonResponse');
    } else {
      print('Failed to load grades: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching grades: $e');
  }
}
