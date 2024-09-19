package main

import (
	"fmt"
	"os"
	"strings"
)

func uncamel(value string) string {
	// myString -> my-string

	var result string         // basic var declaration in go
	for i, v := range value { // python-like range
		if i == 0 { // lower the 1st char
			result += strings.ToLower(string(v))
		} else if v >= 'A' && v <= 'Z' {
			// in go, you can compare chars like this
			// like a>='A' and a<='Z' in C
			result += "-" + strings.ToLower(string(v)) // adds a dash before the char
		} else {
			result += string(v) // just add the char
		}
	}

	return result
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: go run uncamel.go <value>")
		return
	}

	value := os.Args[1]

	fmt.Println(uncamel(value))
}
