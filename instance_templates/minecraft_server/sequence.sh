#!/bin/bash

#Execute DDNS script
sh cloudflare-ddns-update.sh

#Minecraft server configuration. Make sure you have a minecraft folder in your home dir with a server.jar in it.
cd minecraft
screen -d -m -S minecraft java -Xmx3072M -Xms3072M -DIReallyKnowWhatIAmDoingISwear -jar server.jar

#Check if the screen is still up
while screen -list | grep -q minecraft
do
        sleep 10
done

#Shutdown the instance. The sleep is important to cancel a shutdown. You can cancel a shutdown with: sudo shutdown -c
echo "Server exited. Shutting down in 30sec."
sleep 30s
sudo /sbin/shutdown -P +1