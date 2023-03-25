import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../Models/address.dart';
import '../../../Models/city.dart';
import '../../../Models/phone.dart';
import '../../../Models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repository.dart';

class InsertCommand extends Command {
  final StudentRepository stRepository;
  final productRepository = ProductRepository();
  InsertCommand(
    this.stRepository,
  ) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
  }
  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    print('***************************');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    // final students = await stRepository.insert();
    for (var student in students) {
      final studantData = student.split(';');
      final courseCsv = studantData[2].split(',').map((e) => e.trim()).toList();

      final coursesFuture = courseCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();
      final courses = await Future.wait(coursesFuture);
      final studentModel = Student(
        name: studantData[0],
        age: int.tryParse(studantData[1]),
        nameCourses: courseCsv,
        courses: courses,
        address: Address(
          street: studantData[3],
          number: int.parse(studantData[4]),
          zipCode: studantData[5],
          city: City(id: 1, name: studantData[6]),
          phone: Phone(
            ddd: int.parse(studantData[7]),
            phone: studantData[8],
          ),
        ),
      );
      await stRepository.insert(studentModel);
    }
    print('*********************************');
    print('Aluno inserido com Sucesso');
  }
}
