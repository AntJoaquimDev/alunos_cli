import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  // final argsPaser = ArgParser();
  // argsPaser.addFlag('data', abbr: 'd');
  // argsPaser.addOption('name', abbr: 'n');
  // argsPaser.addOption('template', abbr: 't');

  // final argResult = argsPaser.parse(args);

  // print('${argResult['data']}');
  // print('${argResult['name']}');
  // print('${argResult['template']}');

  CommandRunner('ADF CLI', 'ADF CLI')
    ..addCommand(exemplCommand())
    ..run(args);
}

class exemplCommand extends Command {
  @override
  String get description => 'Exemplo de comando';

  @override
  String get name => 'exemplo';
  exemplCommand() {
    argParser.addOption('template',
        abbr: 't', help: 'Templete de criação de projeto');
  }

  @override
  void run() {
    print(argResults?['template']);
    print('run console cli');
  }
}
