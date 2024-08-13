defmodule CLI do
  def main(_args) do
    IO.write("$ ")

    # Wait for user input
    IO.read(:line)
  end
end
