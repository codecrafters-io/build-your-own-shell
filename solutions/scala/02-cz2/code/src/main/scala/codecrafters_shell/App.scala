package codecrafters_shell

@main def main(): Unit = {
  System.out.print("$ ")

  // Wait for user input
  val command = scala.io.StdIn.readLine()
  println(s"$command: command not found")
}
