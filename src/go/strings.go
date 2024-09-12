package main

import (
	"fmt"
	"os"
	"strings"
)

func toLower(value string) string {
	return strings.ToLower(value)
}

func toUpper(value string) string {
	return strings.ToUpper(value)
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: go run main.go <value> [upper|lower]")
		return
	}

	mode := os.Args[1]
	value := os.Args[2]

	if mode == "lower" {
		fmt.Println(toLower(value))
	} else if mode == "upper" {
		fmt.Println(toUpper(value))
	} else {
		fmt.Println("Invalid mode. Use 'lower' or 'upper'.")
	}
}
