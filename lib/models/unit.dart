class Unit {
  final String en;
  final String np;
  final int grade_subject_id;
  final int id;

  Unit({required this.en, required this.np, required this.id,required this.grade_subject_id});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      en: json['en'],
      np: json['np'],
      grade_subject_id: json['grade_subject_id'] as int,
      id: json['id'] as int,
    );
  }

  String toString() {
    return 'Unit(en: $en, np: $np, grade_subject_id: $grade_subject_id, id:$id)';
  }

}
