#!/usr/bin/env python


try:
	a, b = int(input()), int(input())
except ValueError:
	print("Invalid input. Please enter a valid number.")
try:
	result = a / b
except ZeroDivisionError:
	print("Division by zero is not allowed.")
else:
	result = a / b
	print("Division: ", result)

finally:
	print("Execution completed.")
