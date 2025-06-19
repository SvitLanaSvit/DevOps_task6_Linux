#!/bin/bash

random_number=$((RANDOM % 100 + 1))
attempts=0
max_attempts=5

echo "Guess the number (between 1 and 100). You have $max_attempts attempts."

for ((i=1; i<=max_attempts; i++)); do
    read -p "Enter your guess: " guess

    # Check if the input is a valid number
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a number between 1 and 100."
        continue
    fi

    ((attempts++))

    if [ "$guess" -eq "$random_number" ]; then
        echo "Congratulations! You've guessed the number in $attempts attempts."
        exit 0
    elif [ "$guess" -lt "$random_number" ]; then
        echo "Too low! Try again."
    else
        echo "Too high! Try again."
    fi

    echo "Attempts left: $((max_attempts - attempts))"  
   
done

echo "Sorry, you've run out of attempts. The correct number was $random_number."