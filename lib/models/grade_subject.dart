class Grade_Subject {
  final String subject_name;
  final String subject_image_url;

  Grade_Subject({required this.subject_name,required this.subject_image_url});

  factory Grade_Subject.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'subject_name': String subject_name,
        'subject_image_url': String subject_image_url,
      } =>
        Grade_Subject(
          subject_name: subject_name,
          subject_image_url: subject_image_url,
        ),
      _ => throw const FormatException('Failed to load grade subject.'),
    };
  }
}
