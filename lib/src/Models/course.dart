import 'dart:convert';

class Course {
  final int id;
  final String name;
  bool isStudent;
  Course({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "isStudent": isStudent,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map[' id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }
  String toJson() => json.encode(toMap());
  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));

  @override
  String toString() => 'coursos(id: $id, name: $name, isStudent: $isStudent)';
}
