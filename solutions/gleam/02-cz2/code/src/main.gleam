import gleam/io
import gleam/string

pub fn main() {
  io.print("$ ")
  let _ = case io.read_line() {
    Ok(command) -> {
      let cmd = string.trim(command)
      io.println(cmd <> ": command not found")
    }
    Error(_) -> Nil
  }
}
