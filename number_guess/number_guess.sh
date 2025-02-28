#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_PROGRAM(){
  echo -e "\nEnter your username:"

  read USERNAME

  GET_USER_ID=$($PSQL "select user_id from users where username ilike '$USERNAME';")

  if [[ -z $GET_USER_ID ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    ADD_USER=$($PSQL "insert into users(username) values('$USERNAME');")
    if [[ ! -z $ADD_USER ]]
    then
      GET_USER_ID=$($PSQL "select user_id from users where username ilike '$USERNAME';")
    fi
  else
    GET_NUMBER_GAMES=$($PSQL "select count(*) from games where user_id = $GET_USER_ID;")
    GET_BEST_GAME=$($PSQL "select number_of_guesses from games where user_id = $GET_USER_ID order by number_of_guesses ASC limit 1;")

    echo -e "\nWelcome back, $USERNAME! You have played $GET_NUMBER_GAMES games, and your best game took $GET_BEST_GAME guesses."
  fi

  START_GAME $GET_USER_ID

}

# $1 is the user_id
START_GAME() {
  SECRET_NUMBER=$((1 + $RANDOM % 1000))

  GAME_TURN $SECRET_NUMBER "Guess the secret number between 1 and 1000:" $1

}

# $1 is the secret number, $2 is the message, $3 is user_id
GAME_TURN() {
  local SECRET_NUMBER=$1
  local ATTEMPTS=0
  local GUESS=""

  echo -e "\n$2"

  while true; do
    read GUESS

    if [[ ! "$GUESS" =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ "$GUESS" -gt "$SECRET_NUMBER" ]]; then
      ((ATTEMPTS++))
      echo -e "\nIt's lower than that, guess again:"
    elif [[ "$GUESS" -lt "$SECRET_NUMBER" ]]; then
      ((ATTEMPTS++))
      echo -e  "\nIt's higher than that, guess again:"
    else
      ((ATTEMPTS++))
      CREATE_GAME=$($PSQL "insert into games(user_id, secret_number, number_of_guesses) values($3, $SECRET_NUMBER, $ATTEMPTS);")
      echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    fi
  done
}

MAIN_PROGRAM