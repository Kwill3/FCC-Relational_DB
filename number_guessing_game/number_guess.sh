#!/bin/bash
# Number guess script

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

CHECK_USERNAME=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
# Check if new user
if [[ -z $CHECK_USERNAME ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Store new user information
  INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  GAMES_PLAYED=0
  unset BEST_GAME
else
  # Print user information
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$CHECK_USERNAME"
  # Handle singular/plural for games and guesses
  if [[ $GAMES_PLAYED -eq 1 ]]; then
    GAMES_TEXT="game"
  else
    GAMES_TEXT="games"
  fi
  if [[ -z $BEST_GAME || $BEST_GAME -eq 1 ]]; then
    GUESS_TEXT="guess"
  else
    GUESS_TEXT="guesses"
  fi
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED $GAMES_TEXT, and your best game took $BEST_GAME $GUESS_TEXT."
fi

# Generate the secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
# Keep score of number of guesses
ATTEMPTS=1
GUESSER() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  read GUESS
  # Handle non-integer inputs
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    GUESSER "That is not an integer, guess again:"
    (( ATTEMPTS++ ))
  fi
  if (( $GUESS > $SECRET_NUMBER )); then
  # Guess is larger than number
    (( ATTEMPTS++ ))
    GUESSER "It's lower than that, guess again:"
  elif (( $GUESS < $SECRET_NUMBER )); then
  # Guess is smaller than number
    (( ATTEMPTS++ ))
    GUESSER "It's higher than that, guess again:"
  else
    # Guess is correct
    echo -e "\nYou guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Retrieve games played and best game statistics
    if [[ -z $BEST_GAME ]] || (( $ATTEMPTS < $BEST_GAME )); then
      # Record new best guess tries
      RECORD_BEST_RESULT=$($PSQL "UPDATE users SET best_game=$ATTEMPTS WHERE username='$USERNAME';")
    fi
    # Record games played
    NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
    RECORD_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME';")
  fi
}

# Run the guessing game
GUESSER "Guess the secret number between 1 and 1000:"
