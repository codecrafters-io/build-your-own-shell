package codecrafters_shell

object Main extends App {
  while (true) {
    System.out.print("$ ")

    // Wait for user input
    val command = scala.io.StdIn.readLine()
    println(s"$command: command not found")
  }
}
