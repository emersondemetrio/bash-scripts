package main

import (
	"fmt"
	"os"
	"slices"
	"strconv"
)

type OperationMode string

const (
	Hourly  OperationMode = "h"
	Monthly OperationMode = "m"
	Yearly  OperationMode = "y"
)

var validModes = []OperationMode{Hourly, Monthly, Yearly}

const workingHours float64 = 8.0
const workingDays float64 = 22.0
const months float64 = 12.0

// value to month salary
func hToM(hourlyValue float64) float64 {
	return workingHours * hourlyValue * workingDays
}

// value to hourly value
func mToH(salary float64) float64 {
	return salary / workingHours / workingDays
}

// value to year salary
func yToM(yearlySalary float64) float64 {
	return yearlySalary / months
}

// value to year salary
func mToY(salary float64) float64 {
	return salary * float64(months)
}

// hourly to yearly
func hToY(hourlyValue float64) float64 {
	return mToY(hToM(hourlyValue))
}

// yearly to hourly
func yToH(yearlySalary float64) float64 {
	return mToH(yToM(yearlySalary))
}

// value to currency
func valueToCurrency(value float64) string {
	return fmt.Sprintf("$%.2f", value)
}

func printSalary(salary float64, mode OperationMode) {
	var current string
	var conversion1 string
	var conversion2 string

	var salaryS = valueToCurrency(salary)

	switch mode {
	case Hourly:
		current = "Current hourly salary:\t" + salaryS
		conversion1 = "Month:\t\t\t" + valueToCurrency(hToM(salary))
		conversion2 = "Yearly:\t\t\t" + valueToCurrency(hToY(salary))

	case Monthly:
		current = "Current monthly salary:\t" + salaryS
		conversion1 = "Hourly:\t\t\t" + valueToCurrency(mToH(salary))
		conversion2 = "Yearly:\t\t\t" + valueToCurrency(mToY(salary))

	case Yearly:
		current = "Current yearly salary:\t" + salaryS
		conversion1 = "Month salary:\t\t\t" + valueToCurrency(yToM(salary))
		conversion2 = "Hourly salary:\t\t\t" + valueToCurrency(yToH(salary))

	default:
		current = "Current monthly salary:\t" + salaryS
		conversion1 = "Month salary:\t\t\t" + valueToCurrency(yToM(salary))
		conversion2 = "Hourly salary:\t\t\t" + valueToCurrency(yToH(salary))
	}

	fmt.Println(current)
	fmt.Println(conversion1)
	fmt.Println(conversion2)
	return
}

func main() {
	input := os.Args[1]
	mode := OperationMode(os.Args[2])

	salary, err := strconv.ParseFloat(input, 64)

	if err != nil {
		fmt.Println(err)
		return
	}

	if !slices.Contains(validModes, mode) {
		fmt.Println("Invalid mode.\nUsage: salaries [m|h|y] value")
		return
	}

	printSalary(salary, mode)
}
