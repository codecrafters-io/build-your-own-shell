import gleam/erlang/process
import gleam/io

pub fn main() {
  io.println("Sleeping...")
  // Sleep for 1 second (1000 milliseconds)
  process.sleep(100000)
  io.println("Done!")
}
