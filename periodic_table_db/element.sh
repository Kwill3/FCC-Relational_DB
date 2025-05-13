#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if script was passed an argument
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Check argument type
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    # If integer, get element information using atomic number
    ELEMENT_INFO=($($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1;"))
  elif [[ "$1" =~ ^[A-Za-z]+$ ]]
  then
    # If string, check length of string
    string=$1
    count=${#string}
    if [[ $count < 3 ]]
    # If less than 2, get element information using element symbol
    then
      ELEMENT_INFO=($($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$string';"))
    else
    # If more than 2, get element information using element name
      ELEMENT_INFO=($($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$string';"))
    fi
  else
    # If invalid character
    echo "Please enter a valid atomic number, element symbol or element name."
    exit
  fi
  if [[ ! -z $ELEMENT_INFO ]]
  then
    # Display element information
    echo $ELEMENT_INFO | while IFS="|" read NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  else
    # Element not found prompt
    echo "I could not find that element in the database."
  fi
fi
