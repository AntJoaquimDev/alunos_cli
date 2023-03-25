import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class FindByIdCommands extends Command {
  final StudentRepository stRepository;
  FindByIdCommands(this.stRepository) {
    argParser.addOption('id', help: 'Studente por ID', abbr: 'i');
  }
  @override
  String get description => 'Find Student By Id';

  @override
  String get name => 'byId';

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('por favor envie o id do Aluno com comando --id(0) ou -i(0)');
      return;
    }
    print('');
    print('Aguarde buscando Alunos...');
    print('');
    final id = int.parse(argResults?['id'] ?? '');
    final student = await stRepository.findById(id);

    print('*******************************');
    print('* ALUNO ADF           cód: 0${student.id} *');
    print('*******************************');
    print('Nome: ${student.name}');
    print('Idade: ${student.age ?? 'Não informado'}');
    print('Curso: ');
    student.nameCourses.forEach(print);
    print('Endereço:  ');
    print(
        '''Rua:${student.address?.street} Núm: ${student.address?.number} CEP: ${student.address?.zipCode}            
             ''');
  }
}
