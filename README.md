# renegadex-wine-setup-script
A script created by Sho & Testman to download & install all dependencies for Renegade X on Linux.

## Why?
As stated here above, the Wiki is rather hard to find and outdated, combined with the Lutris solution starting to fail, I decided to host a modified script here that adresses most issues people could have trying to get Renegade X to run using wine.

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
# Usage  
Download and execute this script.
```shell
wget https://raw.githubusercontent.com/Constructive-Tyranny/renegadex-wine-setup-script/master/rxWine-setup.sh && chmod +rx rxWine-setup.sh && bash rxWine-setup.sh
```  
Once the script starts, a message from WINE setting up config will appear, afterwards (as you may see in the terminal) it starts downloading & installing dependencies.   

----
## **Any warning from WINE should be ignored, if an app fails to launch, don't view the report. This will cause the setup / execution to fail!**