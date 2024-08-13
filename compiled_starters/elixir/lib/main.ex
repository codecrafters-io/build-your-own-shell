defmodule CLI do
  def main(_args) do
    # Uncomment this block to pass the first stage
    IO.write("$ ")

    # Wait for user input
    IO.read(:line)
  end
end
