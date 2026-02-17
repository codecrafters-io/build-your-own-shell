package codecrafters_shell

object Main extends App {
  System.out.print("$ ")

  // Wait for user input
  val command = scala.io.StdIn.readLine()
  println(s"$command: command not found")
}
