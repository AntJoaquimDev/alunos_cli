import 'dart:io';

import 'package:alunos_cli/src/repositories/student_dio_repository.dart';
import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class FindAllCommads extends Command {
  // final StudentRepository stRepository;
  final StudentDioRepository stRepositoryDio;

  FindAllCommads(this.stRepositoryDio);
  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';
  @override
  run() async {
    print('');
    print('Aguarde buscando Alunos...');
    print('');
    final students = await stRepositoryDio.findAll();
    print('Apresentar também os curso do Aluno? [S/N]');

    final showCourses = stdin.readLineSync();
    print('*******************************');
    print('*     = ALUNOS ADF - CLI =    *');
    print('*******************************');
    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(
            '${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}'
            // '${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudent).toList()}'
            );
      } else {
        print('${student.id}- ${student.name}');
      }
    }
  }
}
