#!/bin/bash

# We create a special Games dir so our mess is easier to clean up if needs be.
# Lutris also uses this dir, so that helps.
mkdir -p $HOME/Games
cd $HOME/Games
# Our required downloads.
# 1. The installer.

if [ -f "Renegade_X_Installer-0.87-release.msi" ];
then
    echo "Installer found."
else
    echo "======================"
    echo "Downloading installer"
    echo "======================"
    wget https://renxdownloads.b-cdn.net/Renegade_X_Installer-0.87-release.msi
fi
# 1.1 UE3 Redist package.
if [ -f "UE3Redist.exe" ];
then
    echo "Installer found."
else
    echo "==============================="
    echo "Downloading UE3 Redist package."
    echo "==============================="
    wget https://renxdownloads.b-cdn.net/UE3Redist.exe
fi

# 2. The ENTIRE WINE PREFIX
if [ -f "RenegadeXWine.zip" ];
then
    echo "Installer found."
elif [ -d "RenegadeXWine" ];
then
    echo "Directory is there, so skipping download"
else
    echo "============================"
    echo "Downloading the Wine prefix"
    echo "============================"
    wget http://cdn.ctgamehosts.uk/cdn/share/RenegadeXWine.zip
fi

echo "Unzipping.."
unzip RenegadeXWine.zip
echo "========================"
echo "Removing downloaded zip."
echo "========================"
rm RenegadeXWine.zip

# Installing installer..
echo "========================================================="
echo "Executing the Renegade X Installer, please go through it."
echo "========================================================="
WINEPREFIX="$HOME/Games/RenegadeXWine" msiexec /i Renegade_X_Installer-0.87-release.msi
rm Renegade_X_Installer-0.87-release.msi

echo "======================================================="
echo "Executing the UE3 Redist package, please go through it."
echo "======================================================="

WINEPREFIX="$HOME/Games/RenegadeXWine" wine UE3Redist.exe
rm UE3Redist.exe

# Gamble part.
# Uncomment if you want to enable this gamble.
while true; do
    echo "This is a pure gamble, but works if you have docker & ACL installed."
    read -p "Do you want to proceed? (y/n) " yn
    
    case $yn in
        [yY] ) echo ok, we will proceed;
        break;;
        [nN] ) echo exiting...;
        exit;;
        * ) echo invalid response;;
    esac
    
done
setfacl -R -m u:1010:rwx $PWD/RenegadeXWine/
sudo docker run -it -v "$PWD/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/":/mounted_volume basimth/rx-updater:latest