loop do
  $stdout.write("$ ")
  $stdout.flush
  command = $stdin.gets
  break if command.nil?

  command = command.chomp
  if command == "exit"
    break
  elsif command == "echo" || command.start_with?("echo ")
    $stdout.puts(command[5..] || "")
  else
    $stdout.puts("#{command}: command not found")
  end
end
