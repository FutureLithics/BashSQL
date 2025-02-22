#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

SALON_NAME="The Vampdaddy Salon"

echo -e "\n~~~vVv $SALON_NAME vVv~~~\n"

SERVICES=$($PSQL "select service_id, name from services order by service_id")

SHOW_SERVICES() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
      echo "$SERVICE_ID) $NAME"
  done

  echo -e "\nWhich service would you like to schedule?"

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SHOW_SERVICES "Please enter a number for the service you want."
  else
    SERVICE_ID_QUERY=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
    
    if [[ -z "$SERVICE_ID_QUERY" ]]
    then
      SHOW_SERVICES "Sorry, but the number you entered does not match a valid service."
    else
      CUSTOMER_ID=$(GET_CUSTOMER_ID)
      CUSTOMER_NAME=$($PSQL "select name from customers where customer_id = $CUSTOMER_ID")
      APPOINTMENT_ID=$(CREATE_APPOINTMENT $CUSTOMER_ID $SERVICE_ID_SELECTED)
      TIME=$($PSQL "select time from appointments where appointment_id = $APPOINTMENT_ID;")

      FORMATTED_NAME=$(FORMAT_TEXT "$CUSTOMER_NAME" "s/^ //g")
      FORMATTED_SERVICE=$(FORMAT_TEXT "$SERVICE_ID_QUERY" "s/^ //g")
      FORMATTED_TIME=$(FORMAT_TEXT "$TIME" "s/^ //g")

      echo "I have put you down for a $FORMATTED_SERVICE at $FORMATTED_TIME, $FORMATTED_NAME."
    fi
  fi
}

GET_CUSTOMER_ID() {

  if [[ $1 ]]
  then
    echo "\n$1\n" >&2
  else
    echo -e "\nWhat is your phone number?" >&2
  fi

  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE';")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo $(CREATE_CUSTOMER $CUSTOMER_PHONE)
  else
    echo $CUSTOMER_ID
  fi
}

CREATE_CUSTOMER() {
  echo -e "\nWe didn't find you in our database, what is your name?" >&2

  read CUSTOMER_NAME

  CUSTOMER_INSERT_QUERY=$($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', '$1')")

  if [[ $CUSTOMER_INSERT_QUERY ]]
  then
    echo $($PSQL "select customer_id from customers where phone = '$1'")
  fi
}

# $1 is customer_id, $2 is service_id
CREATE_APPOINTMENT() {
  echo -e "\nWhat time would you like to come in?" >&2

  read SERVICE_TIME

  APPOINTMENT_INSERT=$($PSQL "insert into appointments(customer_id, service_id, time) values($1, $2, '$SERVICE_TIME');")

  echo $($PSQL "select appointment_id from appointments where time = '$SERVICE_TIME' and customer_id = $1 order by appointment_id DESC limit 1;");
}

# argument $1 is the text, $2 is the format regex
FORMAT_TEXT() {
   sed "$2" <<< "$1"
}

SHOW_SERVICES
