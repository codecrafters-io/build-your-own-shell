import 'dart:io';

void main(List<String> arguments) {
  stdout.write('\$ ');

  // Wait for user input
  String command = stdin.readLineSync()!;
  print('$command: command not found');
}
