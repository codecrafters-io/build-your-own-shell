let () =
  print_string "$ ";
  flush stdout;
  let command = input_line stdin in
  print_endline (command ^ ": command not found")
