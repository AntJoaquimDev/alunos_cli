import 'package:args/command_runner.dart';

import '../repositories/student_repository.dart';
import 'students/subcommands/find_all_commads.dart';
import 'students/subcommands/find_by_id_commands.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentsRepository = StudentRepository();

    addSubcommand(FindAllCommads(studentsRepository));
    addSubcommand(FindByIdCommands(studentsRepository));
  }
}
