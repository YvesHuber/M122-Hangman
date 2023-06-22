#!/bin/bash


function playGame() {

  random_word=$(getWord)
  x=1
  input=""
  win=false
  correctArray=()  # Define the correctArray as an empty array
  guesses=0

    declare -a a   # define array a
for ((i=0; i<${#random_word}; i++)); 
do
    a[$i]="${random_word:$i:1}"
    correctArray[$i]="_"
done
  
  while [[ $win != true ]]
  do
    echo "What word would you like to try"
    read input
    guesses=$((guesses+1))


echo $random_word

for ((i=0; i<${#random_word}; i++)); do
    echo "${a[$i]}"
    if [[ "${a[$i]}" == "$input" ]]; then
        correctArray[$i]="$input"
        echo "$input is correct"
    fi
done


# Print the correctArray
echo "correctArray: ${correctArray[@]}"


if [[ "$input" == "$random_word" ]]; then
  win=true
fi

if [[ $(echo ${correctArray[@]} | fgrep -w "_") ]]
then
  # does contain _
  echo 
else
  # doesnt contain _
  win=true
fi

done
  echo "Guesses" $guesses
  echo "Congratulations! You won!"
}

function getWord() {
  # Define the file
  FILE="./Files/Words.txt"

  # Use shuf to print a random line
  awk 'BEGIN{srand();} {a[NR]=$0} END{print a[int(rand()*NR)+1]}' "$FILE"
}
