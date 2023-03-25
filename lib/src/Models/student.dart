import 'dart:convert';
import 'address.dart';
import 'course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address? address;

  Student({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    this.address,
  });

  Map<String, dynamic> toMap() {
    //2º passo da serializacao criar o mapa
    final map = <String, dynamic>{
      "id": id,
      "name": name,
      "nameCourses": nameCourses,
      "courses": courses.map((courso) => courso.toMap()).toList(),
      "endereco": address?.toMap(),
    };
    if (age != null) {
      map["age"] = age;
    }
    return map;
  }

//3º passo da deserializacao recebe um mapa
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        id: map['id'] ?? 0,
        name: map['name'] ?? '', //"courses
        age: map['age'] ?? 0, //"courses
        nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
        courses: map['courses']
                ?.map<Course>((courseMap) => Course.fromMap(courseMap))
                .toList() ??
            <Course>[],
        address: Address.fromMap(map['address'] ?? <String>{}));
  }

  String toJson() => json.encode(toMap());
  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));
}
