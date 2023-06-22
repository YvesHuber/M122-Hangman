#!/bin/bash

function playGame() {
  input=""
  replay=true
  streak=0

  while [[ $replay == true ]]
  do
    random_word=$(getWord)
    win=false
    correctArray=()
    guesses=0
    errors=0

    declare -a a
    for ((i=0; i<${#random_word}; i++)); do
      a[$i]="${random_word:$i:1}"
      correctArray[$i]="_"
    done

    while [[ $win != true ]]
    do
      cor=false
      echo "What letter would you like to try?"
      read input
      guesses=$((guesses+1))
      echo $random_word

      for ((i=0; i<${#random_word}; i++)); do
        if [[ "${a[$i]}" == "$input" ]]; then
          correctArray[$i]="$input"
          echo "$input is correct"
          cor=true
        fi
      done

      # Print the correctArray
      echo "correctArray: ${correctArray[@]}"

      if [[ "$input" == "$random_word" ]]; then
        cor=true
        win=true
      fi

      if [[ $(echo ${correctArray[@]} | fgrep -w "_") ]]; then
        # contains _
        echo
      else
        # doesn't contain _
        win=true
      fi

      if [[ "$cor" == false ]]; then
        errors=$((errors+1))

        echo "the input was wrong"
        cat "./Hangman-$errors"
        echo ""
        if [[ "$errors" -ge 10 ]]; then
          echo "You lost"
          echo "The word was: $random_word"
          return
        fi
      fi

    done

    echo "Guesses: $guesses"
    echo "Congratulations! You won!"
    echo "Do you want to play again? (Y/N)"
    streak=$((streak+1))

    read input

    if [[ "$input" != "Y" ]]; then
      replay=false
    fi
  done

  echo "Winstreak: $streak"
  echo "Bye!"

  current_date=$(date +%Y-%m-%d)
  current_time=$(date +%H:%M:%S)

  # DU bruachen


  echo "$M122UserName: Winstreak of $streak" >> ./Score/$M122UserName.skill
  echo "Date: $current_date Time: $current_time" >> ./Score/$M122UserName.skill
}

function getWord() {
  FILE="./Files/Words.txt"
  awk 'BEGIN{srand();} {a[NR]=$0} END{print a[int(rand()*NR)+1]}' "$FILE"
}

