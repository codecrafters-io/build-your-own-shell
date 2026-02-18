#include <iostream>
#include <string>

int main() {
  // Flush after every std::cout / std:cerr
  std::cout << std::unitbuf;
  std::cerr << std::unitbuf;

  while (true) {
    std::cout << "$ ";

    std::string input;
    if (!std::getline(std::cin, input)) {
      break;
    }

    if (input == "exit") {
      break;
    }
    std::cout << input << ": command not found" << std::endl;
  }
}
