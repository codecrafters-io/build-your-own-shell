$stdout.write("$ ")
$stdout.flush
command = $stdin.gets
command = command ? command.chomp : ""
$stdout.puts("#{command}: command not found")
