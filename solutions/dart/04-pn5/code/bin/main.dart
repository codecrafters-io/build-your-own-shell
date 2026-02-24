import 'dart:io';

void main(List<String> arguments) {
  while (true) {
    stdout.write('\$ ');

    // Wait for user input
    final command = stdin.readLineSync() ?? '';
    if (command == 'exit') {
      break;
    }
    stdout.writeln('$command: command not found');
  }
}
