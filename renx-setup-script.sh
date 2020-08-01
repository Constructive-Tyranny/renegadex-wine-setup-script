#!/bin/bash
# In case user is already using standard wineprefix or an outdated one, just create a new one.
WINEPREFIX="$HOME/RenegadeXWine" WINEARCH=win64
# assume latest winetricks already installed
# the -q parameter supresses all the GUI warning dialogs, which there are *A LOT* during this process
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q corefonts vcrun2008 vcrun2010 xact xact_64 d3dx9_43 d3dx9 msxml3 d3dcompiler_43
# d3dx9 sets WINE to identify as Windows 2003, so switch back to to Windows 7 so that dotnet452 installation works
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q win7
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q dotnet452 win7
# Obtain the Renegade_X_Installer.msi from DigitalOcean and install it.
echo Attempting to download Renegade_X_Installer
wget https://renxdownloads.nyc3.cdn.digitaloceanspaces.com/Renegade_X_Installer-3f1857a.msi > renegadexinstaller.msi
#Let's warn the user.
echo Attempting to launch the Renegade X installer, please standby.
WINEPREFIX="$HOME/RenegadeXWine" msiexec /i renegadexinstaller.msi
echo Awaiting for user to continue once setup is done.
echo "waiting for user to hit ENTER"
while read answer; do
  if [ -z "$answer" ]; then
    break
  fi
done
WINEPREFIX="$HOME/RenegadeXWine" wine64 "~/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/LauncherRenegade X Launcher.exe"
