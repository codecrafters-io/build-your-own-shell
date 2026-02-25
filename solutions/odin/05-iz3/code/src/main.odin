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

        if command == "exit" {
            break
        } else if strings.has_prefix(command, "echo ") {
            fmt.println(command[5:])
        } else {
            fmt.printf("%s: command not found\n", command)
        }
    }
}
