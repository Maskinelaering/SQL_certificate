#!/bin/bash

DB_NAME="number_guess"  # Replace with your actual database name
PSQL="psql --username=freecodecamp --dbname=$DB_NAME -t --no-align -c"

TARGET_NUMBER=$((RANDOM % 1000 + 1))

echo -n "Enter your username:"
read USERNAME

USERNAME_EXISTS=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")

if [[ -n "$USERNAME_EXISTS" ]]; then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME';")
  CURRENT_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME';")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $CURRENT_BEST_GAME guesses."

else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  SAVE_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME') ON CONFLICT (username) DO NOTHING;")

fi


GUESS_COUNT=0

is_integer() {
  [[ "$1" =~ ^-?[0-9]+$ ]]
}

echo -n "Guess the secret number between 1 and 1000:"
read GUESS

GUESS_COUNT=$((GUESS_COUNT + 1))

while [[ "$GUESS" -ne "$TARGET_NUMBER" ]]; do
  if ! is_integer "$GUESS"; then
    #echo "Guess was $GUESS and target is $TARGET_NUMBER"
    echo "That is not an integer, guess again:"
    
  elif [[ "$GUESS" -gt "$TARGET_NUMBER" ]]; then
    #echo "Guess was $GUESS and target is $TARGET_NUMBER"
    echo "It's lower than that, guess again:"
  elif [[ "$GUESS" -lt "$TARGET_NUMBER" ]]; then
    #echo "Guess was $GUESS and target is $TARGET_NUMBER"
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  GUESS_COUNT=$((GUESS_COUNT + 1))
done


if [[ -z "$CURRENT_BEST_GAME" ]]; then
  BEST_GAME=$GUESS_COUNT
elif [[ "$GUESS_COUNT" -lt "$CURRENT_BEST_GAME" ]]; then
  BEST_GAME=$GUESS_COUNT
else
  BEST_GAME=$CURRENT_BEST_GAME
fi

SAVE_STATS=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = '$BEST_GAME' WHERE username = '$USERNAME';")


echo "You guessed it in $GUESS_COUNT tries. The secret number was $TARGET_NUMBER. Nice job!"

