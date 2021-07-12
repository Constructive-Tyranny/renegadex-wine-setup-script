# This repo is "broken" thanks to the introduction of Wine 6. Please use the Lutris solution and only use this repo for reference.  
**[Lutris](https://lutris.net/games/renegade-x/)** <-- Lutris solution.

# renegadex-wine-setup-script
Script that was on the RenegadeX wiki created by @Testman42, but uploaded here because no-one checks the wiki anyway. ( I don't either)

## Why?
As stated here above, the Wiki is rather hard to find and outdated, combined with the Lutris solution starting to fail, I decided to host a modified script here that adresses most issues people could have trying to get Renegade X to run using wine.

---
## Requirements
An up to date version of **[WINE](https://wiki.winehq.org/Download)**, WINE stagging is recommended.

**[Wget](https://www.gnu.org/software/wget/)** package.

**[cabextract](https://www.cabextract.org.uk/)** package.

The latest version of winetricks.  
(Instructions)  
```shell  
sudo wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
        -O /usr/bin/winetricks \
    && sudo  chmod +rx /usr/bin/winetricks
```  

Although we are not sure if this is actually necessary, Mono-Complete is also recommended.


## Features and usage.
Although the script has the potential to be fully automatic, I've a general tendency to not do that.  
Users should be aware of what they're using and doing.  
The script will create a new wineprefix called: RenegadeXWine.  
And then proceed with downloading the DLL's necessary to run both the UDK.exe and the launcher.

### Usage  
Download and execute this script.
```shell
wget https://raw.githubusercontent.com/Constructive-Tyranny/renegadex-wine-setup-script/master/renx-setup-script.sh && chmod +rx renx-setup-script.sh && sh renx-setup-script.sh
```  
Once the script starts, a message from WINE setting up config will appear, afterwards (as you may see in the terminal) it starts installing all dependencies in the wineprefix.
