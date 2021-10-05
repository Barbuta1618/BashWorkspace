#!/bin/bash

lshw -class disk > usbTest.txt

CHECK=$(cat usbTest.txt | grep "removable")

if [ -z "$CHECK" ]
then
    echo "USB DEVICES NOT FOUND";
else
    NO_USB=$(cat usbTest.txt | grep "removable" | wc -l )
    echo "$NO_USB USB DEVICES FOUND!"
    DIMENSIONS=$(cat usbTest.txt | grep "size:" | tail -$(($NO_USB * 2)))
    echo "$DIMENSIONS" > dim.txt

    for i in $(seq 1 2 $(($NO_USB * 2)))
    do 
        echo "$(sed -n $(($i))p dim.txt)" 
    done

    rm dim.txt
fi

rm usbTest.txt