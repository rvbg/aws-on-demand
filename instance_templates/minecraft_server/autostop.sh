#!/bin/sh

#Path of your latest.log
LOGPATH="/home/ubuntu/minecraft/logs/latest.log"

#Sleeptime before final shutdown
SLEEP=10m

#Default Minecraft empty list return
EMPTY=" There are 0 of a max 20 players online"
EMPTYNEW=" There are 0 of a max of 20 players online"



#Check if the screen is already up
if ! screen -list | grep -q minecraft
then
        exit
fi

#Compare the current player list
$(screen -S minecraft -p 0 -X stuff "list^M")
sleep 5
$(screen -S minecraft -p 0 -X stuff "list^M")
sleep 5
LIST=$(tail -n 1 $LOGPATH | cut -f2 -d"/" | cut -f2 -d":")

if [ "$LIST" = "$EMPTY" ] || [ "$LIST" = "$EMPTYNEW" ]
then
        $(screen -S minecraft -p 0 -X stuff "say [AWS] Server is empty. Eventually shutting down in $SLEEP. ^M")
        sleep $SLEEP

        $(screen -S minecraft -p 0 -X stuff "list^M")
        sleep 5
        $(screen -S minecraft -p 0 -X stuff "list^M")
        sleep 5
        LIST=$(tail -n 1 $LOGPATH | cut -f2 -d"/" | cut -f2 -d":")

        if [ "$LIST" = "$EMPTY" ] || [ "$LIST" = "$EMPTYNEW" ]
        then
                $(screen -S minecraft -p 0 -X stuff "say [AWS] Shutting down. ^M")
                sleep 5
                $(screen -S minecraft -p 0 -X stuff "stop^M")
        fi
fi