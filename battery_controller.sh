#!/bin/bash

# Sets battery charging limit
# Tested on
# --> ASUS ROG Strix GL503GE

# change it according to system
FILE=/sys/class/power_supply/BAT0/charge_control_end_threshold

# help function
helpFunction()
{
   echo ""
   echo "Usage: bash battery_controller.sh [Mode]"
   echo "MODES:"
   echo -e "\t-f \t set mode to Full Capacity [100%]"
   echo -e "\t-b \t set mode to Balanced [80%]"
   echo -e "\t-m \t set mode to Maximum Lifespan [60%]"
   echo -e "\t-t X\t set threshold to X between 0 and 100"
   echo ""
   exit 1
}

# set threshold
setThreshold()
{
    if [ $1 -le 100 ] && [ $1 -ge 0 ]; then
        echo ""
        echo -n "Setted threshold to : "
        echo $1 | tee $FILE
        echo ""
    else
        echo ""
        echo "Threshold should be between 0 and 100"
        helpFunction
    fi
}

# check for root
if [ "$EUID" -ne 0 ]; then
    echo ""
    echo "Please run as root"
    helpFunction
fi

# check if file exists
if [ ! -f "$FILE" ]; then
    echo ""
    echo "Can't open file"
    echo "Please change path to --> charging_control_end_threshold (for ASUS ROG)"
    echo ""
    exit 1
fi

# main
PARAM="$1"
case $PARAM in
    -f ) setThreshold 100 ;;
    -b ) setThreshold 80 ;;
    -m ) setThreshold 60 ;;
    -t ) setThreshold $2 ;;
    * ) helpFunction ;;
esac
