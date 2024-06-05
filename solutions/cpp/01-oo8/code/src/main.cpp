#include <iostream>

int main() {
  std::cout << "$ ";
  std::cout.flush();

  std::string input;
  std::getline(std::cin, input);
}