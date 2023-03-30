import 'dart:convert';

import '../Models/student.dart';
import 'package:http/http.dart' as http;

class StudentRepository {
  Future<void> insert(Student student) async {
    final response = await http.post(
        Uri.parse('http://localhost:3031/students'),
        body: student.toJson(),
        headers: {'content-type': 'application/json'});
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<List<Student>> findAll() async {
    final response =
        await http.get(Uri.parse('http://localhost:3031/students'));

    if (response.statusCode != 200) {
      throw Exception();
    }
    // print('print ${response.statusCode}');
    final responseList = jsonDecode(response.body);
    // print('print ${responseList[2]}');
    return responseList
        .map<Student>((studentMap) => Student.fromMap(studentMap))
        .toList();
  }

  Future<Student> findById(int id) async {
    final response =
        await http.get(Uri.parse('http://localhost:3031/students/$id'));
    if (response.statusCode != 200) {
      throw Exception('Erro na busca');
    }
    if (response.body == '{}') {
      throw Exception('Não existe Estudante com o $id');
    }
    final studentMap = jsonDecode(response.body);
    return Student.fromMap(studentMap);
  }

  Future<void> upDate(Student student) async {
    await http.put(
      Uri.parse('http://localhost:3031/students/${student.id}'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );
  }

  Future<void> removeBYName(Student student) async {
    await http.delete(
      Uri.parse('http://localhost:3031/students/${student.name}'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );
  }

  Future<void> removeById(int id) async {
    await http.delete(
      Uri.parse('http://localhost:3031/students/${id}'),
    );
  }
}
