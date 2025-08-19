#!/bin/bash

DATAFILE="address_book.txt"

add_entry() {
    echo "enter first name:"
    read first_name
    echo "enter last name:"
    read last_name
    echo "enter e-mail:"
    read email
    echo "enter phone:"
    read phone

    echo "you entered: $first_name $last_name $email $phone"
    echo "confirm? (y/n)"
    read confirm

    if [ "$confirm" = "y" ]; then
        echo "$first_name,$last_name,$email,$phone" >> "$DATAFILE"
        echo "entry added!"
    else
        echo "entry discarded."
    fi
}

search_entry() {
    echo "enter search criteria (first_name, last_name, e-mail, phone):"
    read criteria
    echo "matching records:"
    grep -i "$criteria" "$DATAFILE" | awk -F, '{ print "first_name: "$1", last_name: "$2", e-mail: "$3", phone: "$4 }'
}

remove_entry() {
    echo "enter search criteria to remove entry:"
    read criteria
    matches=$(grep -ni "$criteria" "$DATAFILE")
    if [ -z "$matches" ]; then
        echo "no matching record found."
        return
    fi

    echo "matching records:"
    echo "$matches"
    echo "enter line number to remove:"
    read linenum
    sed -i "${linenum}d" "$DATAFILE"
    echo "record removed."
}

display_entries() {
    echo "address Book:"
    awk -F, '{ print NR". first_name: "$1" last_name: "$2" e-mail: "$3" phone: "$4 }' "$DATAFILE"
}

menu() {
    while true; do
        echo "----- address book menu -----"
        echo "1. search address book"
        echo "2. add entry"
        echo "3. remove entry"
        echo "4. display all entries"
        echo "5. exit"
        echo "choose an option:"
        read choice

        case $choice in
            1) search_entry ;;
            2) add_entry ;;
            3) remove_entry ;;
            4) display_entries ;;
            5) echo "exiting..."; exit ;;
            *) echo "invalid option. try again." ;;
        esac
        echo
    done
}

# Create file if it doesn't exist
touch "$DATAFILE"

menu

