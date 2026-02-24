import 'dart:io';

void main(List<String> arguments) {
  stdout.write('\$ ');

  // Wait for user input
  final command = stdin.readLineSync() ?? '';
  stdout.writeln('$command: command not found');
}
