class Grade {
  final String grade;

  Grade({required this.grade});

  factory Grade.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'grade': String grade,
      } =>
        Grade(
          grade: grade,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
