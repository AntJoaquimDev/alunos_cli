import 'package:alunos_cli/src/commands/students/subcommands/delete_command.dart';
import 'package:args/command_runner.dart';

import '../repositories/student_repository.dart';
import 'students/subcommands/find_all_commads.dart';
import 'students/subcommands/find_by_id_commands.dart';
import 'students/subcommands/insert_command.dart';
import 'students/subcommands/upDate_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentsRepository = StudentRepository();

    addSubcommand(FindAllCommads(studentsRepository));
    addSubcommand(FindByIdCommands(studentsRepository));
    addSubcommand(InsertCommand(studentsRepository));
    addSubcommand(UpDateCommand(studentsRepository));
    addSubcommand(DeleteCommand(studentsRepository));
  }
}
