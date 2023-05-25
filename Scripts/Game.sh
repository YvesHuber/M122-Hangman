#Dieser Code ist eigentum der Bundesrepublik deutschland


echo $M122UserName


if [[ -z "${M122UserName}" ]]; then
# undefined
echo "Welcome to our Hangman game"
echo "Enter the user name: "  
read userName
export M122UserName=$userName
else
#defined
echo "Welcome M122UserName to our Hangman game"
fi

echo $M122UserName

