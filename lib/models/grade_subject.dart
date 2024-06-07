class Grade_Subject {
  final String subjectName;
  final String subjectImageUrl;
  final int id;

  Grade_Subject({
    required this.subjectName,
    required this.subjectImageUrl,
    required this.id,
  });

  factory Grade_Subject.fromJson(Map<String, dynamic> json) {
    return Grade_Subject(
      subjectName: json['subject_name'],
      subjectImageUrl: json['subject_image_url'],
      id: json['id'] as int,
    );
  }

  @override
  String toString() {
    return 'Grade_Subject(subjectName: $subjectName, subjectImageUrl: $subjectImageUrl, id: $id)';
  }
}
