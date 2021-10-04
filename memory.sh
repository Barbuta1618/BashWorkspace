#!/bin/bash

MEMORY=$(df -k . | awk -F' *' '{print $3,$4}' | tail -1)
USED_MEMORY=$(echo $MEMORY | awk -F' *' '{print $1}')
FREE_MEMORY=$(echo $MEMORY | awk -F' *' '{print $2}')

TOTAL_MEMORY=$(($USED_MEMORY + $FREE_MEMORY))

printf "TOTAL MEMORY: $TOTAL_MEMORY\nUSED MEMORY: $USED_MEMORY\nFREE MEMORY: $FREE_MEMORY\n"