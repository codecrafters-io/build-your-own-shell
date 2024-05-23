package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// ToDo what to do about these comments ?
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Fprint(os.Stdout, "$ ")
		_, _ = reader.ReadString('\n')
	}
}
