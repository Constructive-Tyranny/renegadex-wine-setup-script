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
# 2. UE3 Redist package.
if [ -f "UE3Redist.exe" ];
then
    echo "Installer found."
else
    echo "==============================="
    echo "Downloading UE3 Redist package."
    echo "==============================="
    wget https://renxdownloads.b-cdn.net/UE3Redist.exe
fi

WINEPREFIX="$HOME/Games/RenegadeXWine" WINEARCH=win64
# Assume latest winetricks already installed.
# The -q parameter supresses all the GUI warning dialogs, which there are *A LOT* during this process.
# Although it does supress the GUI, it still can't shut the fuck up.
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q corefonts
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q vcrun2008
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q vcrun2010
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q xact
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q xact_x64
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q msxml3
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q d3dcompiler_43
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q d3dx9
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q d3dx9_43
# d3dx9 sets WINE to identify as Windows 2003, so switch back to Windows 7.
WINEPREFIX="$HOME/Games/RenegadeXWine" winetricks -q win7
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
        [yY] ) echo Ok, we will proceed.;
        break;;
        [nN] ) echo Exiting...;
        exit;;
        * ) echo Invalid response.;;
    esac
    
done
echo "Setting permissions for the container"
setfacl -R -m u:1010:rwx $PWD/RenegadeXWine/
echo "Calling on the container to download the game."
sudo docker run -it -v "$PWD/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/":/mounted_volume basimth/rx-updater:latest
echo "Setting user permissions back in order."
sudo chown -R $USER:USER "$PWD/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/"