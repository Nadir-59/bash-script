#!/bin/bash

## spinner takes the pid of the process as the first argument and
#  string to display as second argument (default provided) and spins
#  until the process completes.
spinner() {
    local PROC="$1"
    local str="test"
    local delay="0.1"
    tput civis  # hide cursor
    printf "\033[1;34m"
    while [ -d /proc/$PROC ]; do
        printf '\033[s\033[u[ / ] %s\033[u' "$str"; sleep "$delay"
        printf '\033[s\033[u[ — ] %s\033[u' "$str"; sleep "$delay"
        printf '\033[s\033[u[ \ ] %s\033[u' "$str"; sleep "$delay"
        printf '\033[s\033[u[ | ] %s\033[u' "$str"; sleep "$delay"
    done
    printf '\033[s\033[u%*s\033[u\033[0m' $((${#str}+6)) " "  # return to normal
    tput cnorm  # restore cursor
    return 0
}

## simple example with sleep
sleep 5 &

spinner $!
