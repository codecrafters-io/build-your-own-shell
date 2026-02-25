import 'dart:io';

void main(List<String> arguments) {
  while (true) {
    stdout.write('\$ ');

    // Wait for user input
    String command = stdin.readLineSync()!;
    if (command == 'exit') {
      break;
    }
    print('$command: command not found');
  }
}
