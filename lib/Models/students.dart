import 'dart:convert';
import 'address.dart';
import 'course.dart';

class Students {
  String id;
  String name;
  int? idade;
  List<String> nameCourse;
  Address? address;
  List<Course> courses;

  Students({
    required this.id,
    required this.name,
    this.idade,
    required this.nameCourse,
    this.address,
    required this.courses,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "idade": idade,
      "nameCourse": nameCourse,
      "endereco": address?.toMap(),
      "courses": courses.map((curso) => curso.toMap()).toList(),
    };
  }

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      idade: map['idade'],
      nameCourse: map['nameCourse'].cast<String>(),
      address: Address.fromMap(map['address']),
      courses: List<Course>.from(
          map['courses']?.map((courseMap) => Course.fromMap(courseMap))),
    );
  }
  String toJson() => json.encode(toMap());
  factory Students.fromJson(String source) =>
      Students.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Aluno(id: $id, name: $name, idade: $idade, nameCurso: $nameCourse, endereco: $address, cursos: $courses)';
  }
}
