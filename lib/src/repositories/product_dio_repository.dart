import 'dart:convert';

import '../Models/course.dart';
import 'package:dio/dio.dart';

class ProductDioRepository {
  Future<Course> findByName(String name) async {
    try {
      final response = await Dio().get("http://localhost:3031/products",
          queryParameters: {'name': name});

      if (response.data.isEmpty) {
        throw Exception('Produto nao encontrado');
      }
      return Course.fromMap(response.data.first);
    } on DioError {
      throw Exception();
    }
  }
}
/* final String url = "http://localhost:3031/students'";
  Future<void> insert(Student student) async {
    try {
      final studantResult = await Dio().get(url);

      return studantResult.data.map<Student>((student) {
        return Student.fromMap(student);
      }).toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}*/