import gleam/io
import gleam/string

pub fn main() {
  io.print("$ ")
  let input_line = get_line("")

  let command = string.trim(input_line)
  case command {
    "exit" -> Nil
    "echo " <> rest -> {
      io.println(rest)
      main()
    }
    _ -> {
      io.println(command <> ": command not found")
      main()
    }
  }
}

@external(erlang, "io", "get_line")
fn get_line(prompt prompt: String) -> String
