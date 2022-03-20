#!/bin/bash

# We create a special Games dir so our mess is easier to clean up if needs be.
# Lutris also uses this dir, so that helps.
mkdir -p $HOME/Games
cd $HOME/Games
# Our required downloads.
# 1. The installer.
echo "======================"
echo "Downloading installer"
echo "======================"
wget https://renxdownloads.b-cdn.net/Renegade_X_Installer-0.87-release.msi

# 1.1 UE3 Redist package.
echo "======================"
echo "Downloading UE3 Redist package."
echo "======================"
wget https://renxdownloads.b-cdn.net/UE3Redist.exe
# 2. The ENTIRE WINE PREFIX
echo "======================"
echo "Downloading the Wine prefix"
echo "======================"
wget http://cdn.ctgamehosts.uk/cdn/share/RenegadeXWine.zip
echo "Unzipping.."
unzip RenegadeXWine.zip
echo "Removing downloaded zip."
rm RenegadeXWine.zip

# Installing installer..
echo "Executing the Renegade X Installer, please go through it."
WINEPREFIX="$HOME/Games/RenegadeXWine" msiexec /i Renegade_X_Installer-0.87-release.msi
rm Renegade_X_Installer-0.87-release.msi

echo "Executing the UE3 Redist package, please go through it."
WINEPREFIX="$HOME/Games/RenegadeXWine" wine UE3Redist.exe
rm UE3Redist.exe

# Gamble part.
# Uncomment if you want to enable this gamble.

#echo "This is a pure gamble, but works if you have docker & facl installed."
#setfacl -R -m u:1010:rwx $PWD/RenegadeXWine/
#docker run -it -v "$PWD/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/":/mounted_volume dockerrxupdater:latest