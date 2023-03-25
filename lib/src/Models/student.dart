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

  // Map<String, dynamic> toMap() {
  //   //2º passo da serializacao criar o mapa
  //   final map = <String, dynamic>{
  //     "id": id,
  //     "name": name,
  //     "age": age,
  //     "nameCourses": nameCourses,
  //     "courses": courses.map((courso) => courso.toMap()).toList(),
  //     "endereco": address?.toMap(),
  //   };
  //   // if (age != null) {
  //   //   map["age"] = age;
  //   // }
  //   return map;
  // }

//3º passo da deserializacao recebe um mapa
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      age: map['age']?.toInt(),
      nameCourses: List<String>.from(map['nameCourses']),
      courses: List<Course>.from(map['courses']?.map((x) => Course.fromMap(x))),
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
    );
  }

  String toJson() => json.encode(toMap());
  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    if (age != null) {
      result.addAll({'age': age});
    }
    result.addAll({'nameCourses': nameCourses});
    result.addAll({'courses': courses.map((x) => x.toMap()).toList()});
    if (address != null) {
      result.addAll({'address': address!.toMap()});
    }

    return result;
  }
}
