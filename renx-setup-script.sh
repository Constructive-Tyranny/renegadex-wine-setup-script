#!/bin/bash
# used just to get initial wine configuration in case that .wine directory does not exist yet
[[ -d ~/.wine ]] || winecfg 
# assume latest winetricks already installed
# the -q parameter supresses all the GUI warning dialogs, which there are *A LOT* during this process
winetricks -q corefonts vcrun2008 vcrun2010 xact d3dx9_43 d3dx9 msxml3 d3dcompiler_43
# d3dx9 sets WINE to identify as Windows 2003, so switch back to to Windows 7 so that dotnet452 installation works
winetricks -q win7
winetricks -q dotnet452 win7
