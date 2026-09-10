class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int order;
  final int weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.order,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      order: json['order'],
      weight: json['weight'],
    );
  }
}