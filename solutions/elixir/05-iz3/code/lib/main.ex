defmodule CLI do
  def main(_args) do
    loop()
  end

  defp loop do
    IO.write("$ ")
    command = IO.gets("") |> String.trim()

    case command do
      "exit" -> :ok
      "echo " <> args ->
        IO.puts(args)
        loop()
      _ ->
        IO.puts("#{command}: command not found")
        loop()
    end
  end
end
