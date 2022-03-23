# renegadex-wine-setup-script
A script created by Sho & Testman to download & install all dependencies for Renegade X on Linux.

## Why?
The wiki is rather hard to find and outdated, combined with the Lutris solution starting to fail, I decided to host a modified script here that adresses most issues people could have trying to get Renegade X to run using wine.  
The techniques in this script can be used to fix Lutris as well, Lutris should be preforming better than this method if the techniques are applied.

---
## Requirements
An up to date version of **[WINE](https://wiki.winehq.org/Download)**.  
*So that we can actually set up and play the game*  

**[Winetricks](https://github.com/Winetricks/winetricks)**  (Make sure you get the latest version for this URL)  
*So we can set up the prefix*  

**[Wget](https://www.gnu.org/software/wget/)** package.  
*So we can download our requirements*  

**[Docker](https://docs.docker.com/engine/install/)**  
*So we can use the update container to download the game*  

**[ACL](https://wiki.archlinux.org/title/Access_Control_Lists)**  
*So we can set permissions on the WINE Prefix to allow the container to operate*  


## Features and usage.
~~Although the script has the potential to be fully automatic, I've a general tendency to not do that.~~  
*(Sorry old Sho, but my hand got forced)*  

This script will download all the required things, this includes:  
A) Renegade X Launcher Installer  
B) Unreal Engine 3 Redistributable    
<br>
Optional:  
D) A docker image which can run Sonny's update tool to download & update the game.  
<br>
By installing dotnet452 into the prefix, you could get the normal launcher to work, but since this launcher barely works, it is recommended to use the [container](https://github.com/Constructive-Tyranny/docker-renegadex-updater) solution.
# Setup & usage 
## Setup:
Download and execute this script.
```shell
wget https://raw.githubusercontent.com/Constructive-Tyranny/renegadex-wine-setup-script/master/rxWine-setup.sh && chmod +rx rxWine-setup.sh && bash rxWine-setup.sh
```  
Once the script starts, a message from WINE setting up config will appear, afterwards (as you may see in the terminal) it starts downloading & installing dependencies. 

## Usage:
A) Game can be ran from the ``launchRenegadeX.sh`` script in this repo. (you can enable the commented stuff to check for updates using the container)  

B) By executing this in a terminal:  
- ``WINEPREFIX="$HOME/Games/RenegadeXWine" wine "$HOME/Games/RenegadeXWine/drive_c/Program Files (x86)/Renegade X/Binaries/Win64/UDK.exe"``

----
## Known bugs & errors.  
~~**The game itself**~~  

**x has failed to launch! Would you like to view the report?:**  
- *Any warning from WINE should be ignored, if an app fails to launch, don't view the report. This will cause the setup / execution to fail!*
<br>

**Crash when quickly reloading the in-game serverlist:**  
- Known error, not limited to just WINE. your best bet is to join the IRC of CT and watch when someone leaves the game.  
  
**Crash when running the game with the ``-nomovies`` parameter**  
- Known error, recommend keeping movies on.  

**Startup movie kills my ears:**  
- You get used to it. ._.  

**Crash when launching the game:**
- Try again.. I'm not joking, it's like a 75% chance to start the game.  

**Certain maps don't load and cause a crash:**
- We're currently investigating that.