WoW Addons Repository Setup Instructions
This guide provides instructions on how to initialize and configure your local and remote repositories for WoW addons on a computer where WoW is already installed.

Initial Setup
Follow these steps to set up your repository for the first time:

Initial WoW Setup: - Launch WoW to allow it to create the necessary WTF, Interface, and Fonts folders at the root of the installation directory.

Clean Up Existing Git Data: - Search for and delete any .git folders in your local files to prevent cloning issues. For example:

\World of Warcraft\_retail_\.git
\World of Warcraft\_retail_\Interface\AddOns\Roth_UI\.git
SSH Setup: - Ensure your SSH key is registered with BitBucket to clone the repository. - Do not use the command git clone git@bitbucket.org:game1projet/wow_interfaces.git.

Prepare Remote Repository: - If you were using a remote branch and want to keep the same name, delete or rename it in the remote repository first.

Navigate to WoW Root Folder: - Use the command prompt to navigate to the WoW root folder, not the _retail_ or _classic_ subfolders:

cd C:\MeusProjetos  # Windows
cd /path/to/World of Warcraft  # Linux/Mac
Initialize Git Repository: - Run git init to initialize a new Git repository in the current directory.

Add Remote Repository: - Link your local repository to the remote repository:

git remote add origin git@bitbucket.org:game1project/wow_interfaces.git
Configure .gitignore: - Create a .gitignore file in the root of your WoW directory and add the following content:

*
!/_retail_/
!/_retail_/WTF/
!/_retail_/Interface/
!/_retail_/Fonts/
!/_classic_/
!/_classic_/WTF/
!/_classic_/Interface/
!/_classic_/Fonts/
!/_retail_/WTF/**
!/_retail_/Interface/**
!/_retail_/Fonts/**
!/_classic_/WTF/**
!/_classic_/Interface/**
!/_classic_/Fonts/**
!/readme.MD
**/tts-cache-character.txt
**/tts-cache-account.txt
**/tts-cache-account.old
**/macros-cache.txt
**/macros-cache.old
**/flagged-cache-character.txt
**/flagged-cache-account.txt
**/edit-mode-cache-character.txt
**/edit-mode-cache-account.txt
**/Config.wtf
**/config-cache.wtf
**/config-cache.old
**/click-bindings-cache.txt
**/Blizzard_Console.lua.bak
**/Blizzard_Console.lua
**/bindings-cache.wtf
**/bindings-cache.old
**/Addons.txt
**/*.old
**/*.bak
**/*.md5
Retrieving Files from the Repository
To pull existing addon files from the remote repository:

Switch to Target Branch: - Switch to the branch where your addons are stored:

git checkout -b main  # Or another branch
Pull Changes: - Execute git pull to fetch and merge changes from the remote repository.

Updating the Repository with Local Files
To upload your local addon files to the remote repository:

Switch to a New or Existing Branch: - Create or switch to the branch where you want to push your files:

git checkout -b <new-or-existing-branch>
# Example: git checkout -b baredurid_develop
Make Your First Commit: - If there are no commits in your branch, you need to create a commit before pushing:

git commit -m "First replication of addons"
Push Changes: - Push your branch and set the remote tracking branch:

git push --set-upstream origin baredurid_develop
Addons List
(To update, utilize CurseForge https://www.curseforge.com/download/app)

Maintain / Update:

AllTheThings - Addon for querying collections, tracking appearances, illusions, mounts, pets, toys, music rolls, and titles.
Atlas - Map addon. (Outdated as of 29-Apr-24, but still functional)
BagBrother - Allows viewing of bags for alts/characters not currently logged in.
Bagnon - Bag management addon.
Bartender - Manages buttons and macros.
Decursive - Alerts when a party member needs a disease, curse, or poison removed; allows one-click removal.
Details! - Tracks damage done, healing done.
Opie - Ring-style shortcut menu for quick access. Use /opie for options.
Plater - Life bar addon for NPCs and targets.
Postal - Enhances mailbox functionality.
Prat - Chat interface improvement addon.
Scrap - Automatically sells junk and non-valuable items at vendors.
SexyMap - Map interface enhancement addon.
TomTom - Directional arrow addon to indicate quest locations.
LittleWigs - Addon to help in boss fights
Outdated (as of 29-Apr-24) but Still Functional:

GTFO - Alerts the player with a noise when standing in harmful environmental effects.
Hekili - Suggests optimal skill rotation for DPS, tanking, etc.
Leatrix Plus - Offers various quality of life improvements to enhance the default UI in Dragonflight.
Miks Scrolling Battle Text - Displays consolidated damage and healing, avoiding numerous numbers on the screen.
OmniCC - Tracks cooldowns on buttons with a countdown timer.
Pawn - Item comparison tool, shows upgrades and item level.
RothUI - Provides a graphic interface similar to Diablo's style. Only updateable in https://github.com/galaxy119/Roth_UI https://www.wowinterface.com/downloads/info24094-2.1.2.html
Not Listed in the Original Data Provided:

DBM (Deadly Boss Mods) - Raid and dungeon addon that provides timers and alerts for boss fights.