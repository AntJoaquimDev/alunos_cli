import 'dart:convert';

class City {
  final int id;
  final String name;
//  final String uf;
  City({
    required this.id,
    required this.name,
    // required this.uf,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    //result.addAll({'uf': uf});

    return result;
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      // uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));
}
