package main

import (
	"fmt"
	"os"
	"strings"
)

func unsnake(value string) string {
	var result = strings.ReplaceAll(value, "_", " ")
	result = strings.ReplaceAll(result, "-", " ")

	return result
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: go run main.go <value>")
		return
	}

	value := os.Args[1]

	fmt.Println(unsnake(value))
}
