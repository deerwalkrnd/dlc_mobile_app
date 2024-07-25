// file: models/instructor.dart
class Instructor {
  final int id;
  final String name;
  final String nepaliName;
  final String imageUrl;
  final String email;
  final String contact;
  final String? linkedInUrl;

  Instructor({
    required this.id,
    required this.name,
    required this.nepaliName,
    required this.imageUrl,
    required this.email,
    required this.contact,
    this.linkedInUrl,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      nepaliName: json['nepali_name'],
      imageUrl: json['image_url'],
      email: json['email'],
      contact: json['contact'],
      linkedInUrl: json['linkein_url'],
    );
  }
}
