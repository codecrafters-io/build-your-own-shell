package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
    for {
        fmt.printf("$ ")

        buf: [1024]byte
        n, _ := os.read(os.stdin, buf[:])
        command := strings.trim_right(string(buf[:n]), "\r\n")

        if command == "exit" || (len(command) > 4 && command[:4] == "exit" && command[4] == ' ') {
            break
        }

        fmt.printf("%s: command not found\n", command)
    }
}
