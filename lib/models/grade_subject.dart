class Grade_Subject {
  final int id;
  final int gradeId;
  final String subjectName;
  final String subjectImageUrl;

  Grade_Subject({
    required this.id,
    required this.gradeId,
    required this.subjectName,
    required this.subjectImageUrl,
  });

  factory Grade_Subject.fromJson(Map<String, dynamic> json) {
    return Grade_Subject(
      id: json['id'],
      gradeId: json['grade']['id'],
      subjectName: json['subject_name'],
      subjectImageUrl: json['subject_image'],
    );
  }
}
