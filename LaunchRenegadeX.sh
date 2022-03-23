#!/bin/bash
#Only exists to make some people's life easier.
# Requires some extra love to be actually a good product and placing thyself in /local/bin.

#sudo docker run -it -v "$PWD/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/":/mounted_volume basimth/rx-updater:latest
#sudo chown -R $USER:$USER "$PWD/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/"
WINEPREFIX="$HOME/Games/RenegadeXWine" wine "$HOME/Games/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/Binaries/Win64/UDK.exe"