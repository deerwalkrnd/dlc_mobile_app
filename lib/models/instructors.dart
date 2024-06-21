class Instructor {
  final int id;
  final String name;
  final String nepaliName;
  final String imageUrl;
  final String email;
  final String contact;

  Instructor({
    required this.id,
    required this.name,
    required this.nepaliName,
    required this.imageUrl,
    required this.email,
    required this.contact,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      nepaliName: json['nepali_name'],
      imageUrl: json['image_url'],
      email: json['email'],
      contact: json['contact'],
    );
  }
}
