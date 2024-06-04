class Grade {
  final String grade;
  final String grade_image_url;

  Grade({required this.grade,required this.grade_image_url});

  factory Grade.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'grade': String grade,
        'grade_image_url': String grade_image_url,
      } =>
        Grade(
          grade: grade,
          grade_image_url: grade_image_url,
        ),
      _ => throw const FormatException('Failed to load grade.'),
    };
  }
}
