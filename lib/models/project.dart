class Project {
  final String? id;
  final String name;
  final String description;
  final String status;
  final int? budget; // Eğer bütçe kullanıyorsan ekleyebilirsin

  Project({
    this.id,
    required this.name,
    required this.description,
    required this.status,
    this.budget,
  });

  // JSON verisini Dart nesnesine çeviren yardımcı metod (Factory Constructor)
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      budget: json['budget'],
    );
  }

  // Dart nesnesini JSON'a çeviren metod (POST/PUT işlemleri için gerekecek)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'budget': budget,
    };
  }
}