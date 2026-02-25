package codecrafters_shell

object Main extends App {
  while (true) {
    System.out.print("$ ")

    // Wait for user input
    val command = scala.io.StdIn.readLine()
    if (command == null) {
      sys.exit(0)
    } else if (command == "exit") {
      sys.exit(0)
    } else if (command.startsWith("echo ")) {
      println(command.drop(5))
    } else {
      println(s"$command: command not found")
    }
  }
}
