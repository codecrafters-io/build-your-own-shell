import gleam/erlang
import gleam/io

pub fn main() {
  io.print("$ ")

  // Wait for user input
  erlang.get_line("")
}
