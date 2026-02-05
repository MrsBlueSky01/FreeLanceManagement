class Project {
  String? id;
  String name; // final olmamalı
  String description; // final olmamalı
  String status; // final olmamalı

  Project({
    this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  // JSON'dan nesneye çevirme
  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    status: json['status'],
  );

  // Nesneden JSON'a çevirme
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
  };
}
