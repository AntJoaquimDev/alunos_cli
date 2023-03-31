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
