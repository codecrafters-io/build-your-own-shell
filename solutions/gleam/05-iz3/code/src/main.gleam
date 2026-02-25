import gleam/io
import gleam/erlang
import gleam/string

pub fn main() {
  io.print("$ ")
  let assert Ok(command) = erlang.get_line("")

  let cmd = string.trim(command)
  case cmd {
    "exit" -> Nil
    "echo" -> {
      io.println("")
      main()
    }
    "echo " <> rest -> {
      io.println(rest)
      main()
    }
    _ -> {
      io.println(cmd <> ": command not found")
      main()
    }
  }
}
