#!/bin/bash
# In case user is already using standard wineprefix or an outdated one, just create a new one.
WINEPREFIX="$HOME/RenegadeXWine" WINEARCH=win64
# assume latest winetricks already installed
# the -q parameter supresses all the GUI warning dialogs, which there are *A LOT* during this process
# Although it does supress the GUI, it still can't shut the fuck up.
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q corefonts
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q vcrun2008
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q vcrun2010
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q xact
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q xact_x64
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q msxml3
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q d3dcompiler_43
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q d3dx9
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q d3dx9_43
# d3dx9 sets WINE to identify as Windows 2003, so switch back to to Windows 7 so that dotnet452 installation works
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q win7
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q dotnet452
WINEPREFIX="$HOME/RenegadeXWine" winetricks -q win7
# Obtain the Renegade_X_Installer.msi from DigitalOcean and install it.
echo Attempting to download Renegade_X_Installer
wget https://renxdownloads.b-cdn.net/Renegade_X_Installer-3f1857a.msi
#Let's warn the user.
echo Attempting to launch the Renegade X installer, please standby.
WINEPREFIX="$HOME/RenegadeXWine" msiexec /i Renegade_X_Installer-3f1857a.msi
WINEPREFIX="$HOME/RenegadeXWine" wine "$HOME/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/Launcher/Renegade X Launcher.exe"
