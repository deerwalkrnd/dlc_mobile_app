class GradeSubject {
  final int id;
  final String subjectName;
  final String subjectImage;

  GradeSubject({
    required this.id,
    required this.subjectName,
    required this.subjectImage,
  });

  factory GradeSubject.fromJson(Map<String, dynamic> json) {
    return GradeSubject(
      id: json['id'],
      subjectName: json['subject_name'],
      subjectImage: json['subject_image'],
    );
  }
}

class Chapter {
  final int id;
  String title;
  final String titleNepali;
  final String url;

  Chapter({
    required this.id,
    required this.title,
    required this.titleNepali,
    required this.url,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      title: json['title'],
      titleNepali: json['title_nepali'] ?? '',
      url: json['url'],
    );
  }
}

class Unittwo {
  final int id;
  final GradeSubject gradeSubject;
  String name;
  final String nepaliName;
  final int unitNumber;
  List<Chapter> chapters;

  Unittwo({
    required this.id,
    required this.gradeSubject,
    required this.name,
    required this.nepaliName,
    required this.unitNumber,
    required this.chapters,
  });

  factory Unittwo.fromJson(Map<String, dynamic> json) {
    var chaptersList = json['chapters'] as List<dynamic>? ?? [];
    List<Chapter> chapters = chaptersList.map((i) => Chapter.fromJson(i)).toList();

    return Unittwo(
      id: json['id'],
      gradeSubject: GradeSubject.fromJson(json['grade_subject']),
      name: json['name'],
      nepaliName: json['nepali_name'],
      unitNumber: json['unit_number'],
      chapters: chapters,
    );
  }
}

class ApiResponse {
  final List<Unittwo> data;

  ApiResponse({
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Unittwo> unitsList = list.map((i) => Unittwo.fromJson(i)).toList();
    return ApiResponse(data: unitsList);
  }
}
