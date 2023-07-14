class Exercise {
  final int id;
  final String name;
  final String category;
  bool isSelected;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
  }) : isSelected = false;

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      category: json['category'],
    );
  }
}
