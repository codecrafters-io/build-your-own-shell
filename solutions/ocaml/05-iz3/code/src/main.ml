let starts_with s prefix =
  let len_s = String.length s in
  let len_p = String.length prefix in
  len_s >= len_p && String.sub s 0 len_p = prefix

let () =
  while true do
    print_string "$ ";
    flush stdout;
    let command = input_line stdin in
    if command = "exit" then
      exit 0
    else if starts_with command "echo " then
      print_endline (String.sub command 5 (String.length command - 5))
    else
      print_endline (command ^ ": command not found")
  done
