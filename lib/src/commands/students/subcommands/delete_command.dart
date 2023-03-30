import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../Models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repository.dart';

class DeleteCommand extends Command {
  StudentRepository stRepository;
  DeleteCommand(this.stRepository) {
    // argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Studant passar Id', abbr: 'i');
  }

  final productRepository = ProductRepository();
  @override
  String get description => 'Delete Studentes by (id)';

  @override
  String get name => 'delete';

  @override
  Future<void> run() async {
    print('*********** Buscando Aluno ****************');
    //final filePath = argResults?['file'];
    final id = int.tryParse(argResults?['id']);
    if (id == null) {
      print('Por favor informe o Id do Aluno com o comando --id = x ou -i x');
      return;
    }
    print('---Aguarde ...');
    final student = await stRepository.findById(id);

    // final students = File(filePath).readAsLinesSync();
    print('---Aguarde buscando aluno ...com id= $id');
    print('Você confirma a remoção do Aluno $id (S/N)');
    final confirmeDelete = stdin.readLineSync();
    if (confirmeDelete?.toLowerCase() == 's') {
      print('*********************************');
      await stRepository.removeById(id);
      print('Aluno Removido com Sucesso');
      print('*********************************');
    } else {
      print('*********************');
      print('Operação cancelada.');
      print('*********************');
    }
  }
}
