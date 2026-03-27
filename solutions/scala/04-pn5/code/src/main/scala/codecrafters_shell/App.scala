package codecrafters_shell

@main def main(): Unit = {
  while (true) {
    System.out.print("$ ")

    // Wait for user input
    val command = scala.io.StdIn.readLine()
    if (command == "exit") {
      sys.exit(0)
    }
    println(s"$command: command not found")
  }
}
