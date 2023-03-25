import 'package:alunos_cli/src/commands/students_command.dart';
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  CommandRunner('ADF CLI', 'ADF CLI')
    ..addCommand(StudentsCommand())
    ..run(args);
}
