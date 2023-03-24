import 'dart:convert';
import 'address.dart';
import 'course.dart';

class Students {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final Address? address;
  final List<Course> courses;

  Students({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    this.address,
    required this.courses,
  });

  Map<String, dynamic> toMap() {
    //2º passo da serializacao criar o mapa
    final map = <String, dynamic>{
      "id": id,
      "name": name,
      "nameCourses": nameCourses,
      "endereco": address?.toMap(),
      "courses": courses.map((curso) => curso.toMap()).toList(),
    };
    if (age != null) {
      map["age"] = age;
    }
    return map;
  }

//3º passo da deserializacao recebe um mapa
  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
        address: Address.fromMap(map['address'] ?? <String>{}),
        courses: map['courses']
                ?.map<Course>((couseMap) => Course.fromMap(couseMap))
                .toList() ??
            <Course>[]);
  }
  String toJson() => json.encode(toMap());
  factory Students.fromJson(String source) =>
      Students.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Aluno(id: $id, name: $name, age: $age, nameCurso: $nameCourses, endereco: $address, cursos: $courses)';
  }
}
