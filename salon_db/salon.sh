#!/bin/bash
# Salon Appointment Scheduler
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Salon Appointment Scheduler ~~~"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "What service would you like to book today?"
  echo -e "1) Cut"
  echo -e "2) Color"
  echo -e "3) Wash"
  echo -e "4) Curl"
  echo -e "5) Straighten"

  read SERVICE_ID_SELECTED
  # check input is a valid number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # return to main menu if invalid
    MAIN_MENU "That is not a valid option, please enter a number."
  else
    SERVICE_ID_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    # check input is a valid option of service
    if [[ ! -z $SERVICE_ID_RESULT ]]
    then
      echo "You have selected"$SERVICE_ID_RESULT"."
      # get customer info
      echo -e "\nWhat is your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then
        # get new customer name
        echo -e "\nI don't have a record for that phone number, what is your name?"
        read CUSTOMER_NAME
        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
      fi
      echo -e "\nHi '$CUSTOMER_NAME'. What time would you like to book your appointment?"
      read SERVICE_TIME

      # retrieve customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
      # insert appointment record
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
      if [[ $INSERT_APPOINTMENT_RESULT = "INSERT 0 1" ]]
      then
        echo -e "\nI have put you down for a$SERVICE_ID_RESULT at $SERVICE_TIME, $CUSTOMER_NAME."
        EXIT
      else
        MAIN_MENU "Something went wrong. Please try again."
      fi
    else
      MAIN_MENU "Please enter a valid option."
    fi
  fi
}

EXIT() {
  echo -e "\nThank you for booking with us. See you soon\n"
}

MAIN_MENU