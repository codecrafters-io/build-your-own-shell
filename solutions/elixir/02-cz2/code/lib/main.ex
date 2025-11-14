defmodule CLI do
  def main(_args) do
    IO.write("$ ")

    case IO.gets("") do
      nil ->
        :ok

      command ->
        command = String.trim(command)
        IO.puts("#{command}: command not found")
    end
  end
end
