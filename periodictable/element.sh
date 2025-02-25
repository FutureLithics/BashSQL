#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  NUM=$1
  if [[ "$NUM" =~ ^[0-9]+$ ]]
  then
    ELEMENT_QUERY=$($PSQL "select atomic_number from elements where atomic_number = $NUM;")
  else
    ELEMENT_QUERY=$($PSQL "select atomic_number from elements where name like '$NUM' or symbol like '$NUM';")
  fi

  if [[ -z $ELEMENT_QUERY ]]
  then
    echo "I could not find that element in the database."
  else
    ELEMENT_QUERY=$($PSQL "select * from elements inner join properties on elements.atomic_number = properties.atomic_number inner join types on properties.type_id = types.type_id where elements.atomic_number = $ELEMENT_QUERY;")

    echo "$ELEMENT_QUERY" | while IFS=" | " read -r NUMBER SYMBOL NAME A_NUMBER ATOMIC_MASS MELT BOIL TYPE_ID TI TYPE
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
fi
