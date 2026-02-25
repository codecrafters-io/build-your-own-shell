import 'dart:io';

void main(List<String> arguments) {
  while (true) {
    stdout.write('\$ ');

    // Wait for user input
    String command = stdin.readLineSync()!;
    if (command == 'exit') {
      break;
    } else if (command == 'echo' || command.startsWith('echo ')) {
      print(command == 'echo' ? '' : command.substring(5));
    } else {
      print('$command: command not found');
    }
  }
}
