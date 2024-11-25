package main

import (
	"bufio"
	"fmt"
	"os"
)

// Ensures gofmt doesn't remove the "fmt" import in stage 1 (feel free to remove this!)
var _ = fmt.Fprint

func main() {
	fmt.Fprint(os.Stdout, "$ ")

	// Wait for user input
	command, _ := bufio.NewReader(os.Stdin).ReadString('\n')
	fmt.Println(command[:len(command)-1] + ": command not found")
}
