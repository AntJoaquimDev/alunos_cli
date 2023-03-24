import 'dart:convert';

import '../Models/course.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<Course> findByName(String name) async {
    final response =
        await http.get(Uri.parse("http://localhost:3031/products?name=$name"));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData.isEmpty) {
        throw Exception('Produto nao encontrado');
      }
      return Course.fromMap(responseData.first);
    } else {
      throw Exception();
    }
  }
}
