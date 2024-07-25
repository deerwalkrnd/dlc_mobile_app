class Grade {
  final int id;
  final int grades;

  Grade({required this.id, required this.grades});

  factory Grade.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') && json.containsKey('grades')) {
      return Grade(
        id: json['id'] as int,
        grades: json['grades'] as int,
      );
    } else {
      throw const FormatException('Failed to load grade.');
    }
  }
}
