#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

Trunk="$($PSQL "TRUNCATE TABLE teams, games;")"

FILE="games.csv"

while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  # check if winner and or opponent are in db
  if [[ $winner != "winner" ]]
  then
    WINNER_ID="$($PSQL "select team_id from teams where name like '$winner';")"
    if [[ -z $WINNER_ID ]]
    then
      WINNER_ID_INSERT="$($PSQL "insert into teams(name) values('$winner');")"
      if [[ $WINNER_ID_INSERT == "INSERT 0 1" ]]
      then
        WINNER_ID="$($PSQL "select team_id from teams where name like '$winner';")"
      fi
    fi

    OPPONENT_ID="$($PSQL "select team_id from teams where name like '$opponent';")"
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_ID_INSERT="$($PSQL "insert into teams(name) values('$opponent');")"
      if [[ $OPPONENT_ID_INSERT == "INSERT 0 1" ]]
      then
        OPPONENT_ID="$($PSQL "select team_id from teams where name like '$opponent';")"
      fi
    fi

    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);"
  fi
done < "$FILE"

