import 'dart:io';

import 'package:alunos_cli/src/Models/address.dart';
import 'package:alunos_cli/src/Models/city.dart';
import 'package:alunos_cli/src/Models/phone.dart';
import 'package:alunos_cli/src/Models/student.dart';
import 'package:args/command_runner.dart';

import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repository.dart';

class UpDateCommand extends Command {
  StudentRepository stRepository;
  UpDateCommand(this.stRepository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Studant passar Id', abbr: 'i');
  }

  final productRepository = ProductRepository();
  @override
  String get description => 'UpDate Studentes(Alunos)';

  @override
  String get name => 'upDate';

  @override
  Future<void> run() async {
    print('---Aguarde ...');

    print('*********** Atualizar Alunos ****************');
    final filePath = argResults?['file'];
    final id = argResults?['id'];
    if (id == null) {
      print('Por favor informe o Id do Aluno com o comando --id = x ou -i x');
      return;
    }

    final students = File(filePath).readAsLinesSync();
    print('---Aguarde Atualizando dados do aluno ...');
    if (students.length > 1) {
      print('Por favor informe somente um Aluno no arquivo $filePath');
      return;
    } else if (students.isEmpty) {
      {
        print('Por favor informe um aluno no arquivo=>  $filePath');
        return;
      }
    }
    var student = students.first;

    final studantData = student.split(';');
    final courseCsv = studantData[2].split(',').map((e) => e.trim()).toList();

    final coursesFuture = courseCsv.map((c) async {
      final course = await productRepository.findByName(c);
      course.isStudent = true;
      return course;
    }).toList();
    final courses = await Future.wait(coursesFuture);
    final studentModel = Student(
      id: int.parse(id),
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
    await stRepository.upDate(studentModel);

    print('*********************************');
    print('Aluno Atualizado com Sucesso');
  }
}
