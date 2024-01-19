#!/bin/bash

#Ask the user to enter their name 
echo "Enter your name"
read name 
echo "Hello $name!"

#Ask the user for their first number of choice
echo "$name, enter a number"
read a

#Ask the user for their second number of choice
echo "$name, enter another number!"
read b

#This will add up the two numbers and give the user the result.
var=$((a+b))
echo "$name, the sum of the two numbers you gave me is $var!"
