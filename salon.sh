#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo "Hello! Please choose a service by typing the number next to it."

GET_SERVICES() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
    ID=$(echo $SERVICE_ID | sed 's/ //g')
    NAME=$(echo $NAME | sed 's/ //g')
    echo "$ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]+$ ]]
  then GET_SERVICES
  else
    
    echo -e "\nWhat is your phone number?"

    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    echo -e "\nWhat time do you want (hh:mm)?"
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}





GET_SERVICES
