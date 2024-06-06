class Instructor {
  final String name_en;
  final String name_np;
  final String image_url;
  final String contact_number;
  final String email;
  final String? linkedin_url; 

  Instructor({
    required this.name_en,
    required this.name_np,
    required this.image_url,
    required this.contact_number, 
    required this.email,
    this.linkedin_url,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      name_en: json['name_en'] as String,
      name_np: json['name_np'] as String,
      image_url: json['image_url'] as String,
      contact_number: json['contact_number'],
      email: json['email'] as String,
      linkedin_url: json['linkedin_url'] as String?,
    );
  }
}
