#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

DB_NAME="periodic_table"   # Replace with your actual database name

# Set up the PSQL command format
PSQL="psql --username=freecodecamp --dbname=$DB_NAME -t --no-align -c"

if [ "$1" == "Hydrogen" ] || [ "$1" == "H" ] || [ "$1" == "1" ]; then
    ELEMENT="Hydrogen"
    SYMBOL="H"
    ATOMIC_NUMBER=1
elif [ "$1" == "Helium" ] || [ "$1" == "He" ] || [ "$1" == "2" ]; then
    ELEMENT="Helium"
    SYMBOL="He"
    ATOMIC_NUMBER=2
elif [ "$1" == "Lithium" ] || [ "$1" == "Li" ] || [ "$1" == "3" ]; then
    ELEMENT="Lithium"
    SYMBOL="Li"
    ATOMIC_NUMBER=3
elif [ "$1" == "Beryllium" ] || [ "$1" == "Be" ] || [ "$1" == "4" ]; then
    ELEMENT="Beryllium"
    SYMBOL="Be"
    ATOMIC_NUMBER=4
elif [ "$1" == "Boron" ] || [ "$1" == "B" ] || [ "$1" == "5" ]; then
    ELEMENT="Boron"
    SYMBOL="B"
    ATOMIC_NUMBER=5
elif [ "$1" == "Carbon" ] || [ "$1" == "C" ] || [ "$1" == "6" ]; then
    ELEMENT="Carbon"
    SYMBOL="C"
    ATOMIC_NUMBER=6
elif [ "$1" == "Nitrogen" ] || [ "$1" == "N" ] || [ "$1" == "7" ]; then
    ELEMENT="Nitrogen"
    SYMBOL="N"
    ATOMIC_NUMBER=7
elif [ "$1" == "Oxygen" ] || [ "$1" == "O" ] || [ "$1" == "8" ]; then
    ELEMENT="Oxygen"
    SYMBOL="O"
    ATOMIC_NUMBER=8
elif [ "$1" == "moTanium" ] || [ "$1" == "Mt" ] || [ "$1" == "1000" ]; then
    ELEMENT="moTanium"
    SYMBOL="Mt"
    ATOMIC_NUMBER=1000
elif [ "$1" == "Fluorine" ] || [ "$1" == "F" ] || [ "$1" == "9" ]; then
    ELEMENT="Fluorine"
    SYMBOL="F"
    ATOMIC_NUMBER=9
elif [ "$1" == "Neon" ] || [ "$1" == "Ne" ] || [ "$1" == "10" ]; then
    ELEMENT="Neon"
    SYMBOL="Ne"
    ATOMIC_NUMBER=10
else 
    echo "I could not find that element in the database."
    exit 0
fi

ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$ATOMIC_NUMBER';")
TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = '$ATOMIC_NUMBER';")
TYPE=$($PSQL "SELECT type FROM types WHERE type_id = '$TYPE_ID';")
MELTING_POINT_CELSIUS=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER';")
BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER';")

echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT ($SYMBOL). \
It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT has a melting point of $MELTING_POINT_CELSIUS celsius \
and a boiling point of $BOILING_POINT_CELSIUS celsius."
