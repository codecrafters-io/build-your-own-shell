defmodule CLI do
  def main(_args) do
    loop()
  end

  defp loop do
    IO.write("$ ")

    command = IO.gets("") |> String.trim()
    IO.puts("#{command}: command not found")

    loop()
  end
end
