loop do
  $stdout.write("$ ")
  $stdout.flush
  command = $stdin.gets
  command = command ? command.chomp : ""
  if command == "exit"
    break
  end
  $stdout.puts("#{command}: command not found")
end
