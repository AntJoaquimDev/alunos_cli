import 'dart:convert';

import 'package:dio/dio.dart';

import '../Models/student.dart';
import 'package:http/http.dart' as http;

class StudentDioRepository {
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
    final url = 'http://localhost:3031/students';

    try {
      final studantResult = await Dio().get(url);

      return studantResult.data
          .map<Student>((studentMap) => Student.fromMap(studentMap))
          .toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<Student> findById(int id) async {
    final url = 'http://localhost:3031/students/$id';

    try {
      final studantResult = await Dio().get(url);
      if (studantResult.data == null) {
        throw Exception('Id do stdudante não pode ser vazio.');
      }

      return Student.fromMap(studantResult.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Não existe Estudante com o $id');
    }
  }

  // throw Exception('Não existe Estudante com o $id');
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
    await Dio()
        .delete('http://localhost:3031/students/', queryParameters: {'id': id});
  }
}
