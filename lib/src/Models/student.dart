import 'dart:convert';
import 'address.dart';
import 'course.dart';
/*
    "id": 1,
    "name": "Celenny Cristhyne",
    "nameCourses": [
        "Academia Flutter"
    ],
    "courses": [
        {
            "id": 1,
            "name": "Academia do Flutter",
            "isStudent": true
        },
        {
            "id": 2,
            "name": "Jornada GetX",
            "isStudent": false
        },
        {
            "id": 3,
            "name": "Jornada Clean Code",
            "isStudent": false
        },
        {
            "id": 4,
            "name": "Jornada Arquitetura",
            "isStudent": false
        }
    ],
    "address": {
        "street": "Rua Tiradentes",
        "number": 654,
        "zipCode": "64230-000",
        "city": {
            "id": 1,
            "name": "Buriti dos Lopes"
        },
        "phone": {
            "ddd": 86,
            "phone": "948755556"
        }
    }*/

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
