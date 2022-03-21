# renegadex-wine-setup-script
Script that was on the RenegadeX wiki created by @Testman42, but uploaded here because no-one checks the wiki anyway. ( I don't either)

## Why?
As stated here above, the Wiki is rather hard to find and outdated, combined with the Lutris solution starting to fail, I decided to host a modified script here that adresses most issues people could have trying to get Renegade X to run using wine.

---
## Requirements
An up to date version of **[WINE](https://wiki.winehq.org/Download)**.  
*So that we can actually use the prefix*  

**[Wget](https://www.gnu.org/software/wget/)** package.  
*So we can download our requirements*  

**[Docker](https://docs.docker.com/engine/install/)**  
*So we can use the update container to download the game*  

**[ACL](https://wiki.archlinux.org/title/Access_Control_Lists)**  
*So we can set permissions on the WINE Prefix to allow the container to operate*  

*Although we are not sure if this is actually necessary, Mono-Complete is also recommended.*


## Features and usage.
~~Although the script has the potential to be fully automatic, I've a general tendency to not do that.~~  
*(Sorry old Sho, but my hand got forced)*  

This script will download all the required things, this includes:  
A) Renegade X Launcher Installer  
B) Unreal Engine 3 Redistributable  
C) A WINE prefix with all required DLL's to run the game.   
*(This is using an older WINE prefix which can still run the game without breaking dependencies.)*  
<br>
Optional:  
D) A docker image which can run Sonny's update tool to download & update the game.  

# Usage  
Download and execute this script.
```shell
wget https://raw.githubusercontent.com/Constructive-Tyranny/renegadex-wine-setup-script/master/rxWine-setup.sh && chmod +rx rxWine-setup.sh && bash rxWine-setup.sh
```  
Once the script starts, a message from WINE setting up config will appear, afterwards (as you may see in the terminal) it starts downloading & installing dependencies.   

----
## **Any warning from WINE should be ignored, if an app fails to launch, don't view the report. This will cause the setup / execution to fail!**