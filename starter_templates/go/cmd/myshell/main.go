package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// ToDo what to do about these comments ?
	// You can use print statements as follows for debugging, they'll be visible when running tests.
	// fmt.Println("Logs from your program will appear here!")

	reader := bufio.NewReader(os.Stdin)
	for {
		// Uncomment this block to pass the first stage
		// fmt.Fprint(os.Stdout, "$ ")
		_, _ = reader.ReadString('\n')
	}
}
