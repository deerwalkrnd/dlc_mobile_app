class Unit {
  final String en;
  final String np;

  Unit({required this.en,required this.np});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'en': String en,
        'np': String np,
      } =>
        Unit(
          en: en,
          np: np,
        ),
      _ => throw const FormatException('Failed to load units.'),
    };
  }
}
