#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo  "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo  "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo  "$($PSQL "SELECT round(AVG(total_goals), 16) FROM (SELECT AVG(winner_goals) + AVG(opponent_goals) as total_goals FROM games) as x")"

echo -e "\nMost goals scored in a single game by one team:"
echo  "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo  "$($PSQL " select count(*) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo  "$($PSQL "SELECT name FROM games inner join teams on games.winner_id = teams.team_id where year = 2018 and round ilike 'final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo  "$($PSQL "SELECT DISTINCT t.name FROM teams t JOIN ( SELECT winner_id AS team_id FROM games where year = 2014 and round = 'Eighth-Final' UNION SELECT opponent_id FROM games where year = 2014 and round = 'Eighth-Final') g ON t.team_id = g.team_id;")"

echo -e "\nList of unique winning team names in the whole data set:"
echo  "$($PSQL "SELECT DISTINCT name FROM games inner join teams on games.winner_id = teams.team_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT DISTINCT year, name FROM games inner join teams on games.winner_id = teams.team_id where round ilike 'final'")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL " select name from teams where name like 'Co%'")"
