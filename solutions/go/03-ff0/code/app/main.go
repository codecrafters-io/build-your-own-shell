package main

import (
	"bufio"
	"fmt"
	"os"
)

var _ = fmt.Print

func main() {
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Print("$ ")

		// Wait for user input
		command, err := reader.ReadString('\n')
		if err != nil {
			fmt.Fprintln(os.Stderr, "Error reading input:", err)
			os.Exit(1)
		}
		fmt.Println(command[:len(command)-1] + ": command not found")
	}
}