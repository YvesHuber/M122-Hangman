#!/bin/bash

#Dieser Code ist eigentum der Bundesrepublik deutschland
source ./GameLoop.sh

echo "Welcome to our Hangman game"
echo "Enter the user name: "  
# Benutzereingaben 1.2
read userName
if [ -n "$userName" ]; then
  #Umgebungsvariablen bruachen 1.7

export M122UserName=$userName

#defined
echo "Welcome $M122UserName to our Hangman game"

playGame

fi

