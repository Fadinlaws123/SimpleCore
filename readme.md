# SimpleCore v1.1.2 Release

### Thank you for downloading SimpleCore!

* *Now that you downloaded SimpleCore, you might be wondering how to install it. and to keep it short and simple, hints the name, it is very easy to get started with. Read below as there are sections posted for where you are needing the most assistance with! If you are unable to see get it to work, you can add me on discord @fadin_laws and I will get with you whenever I am available!*

<details><summary>Getting Started</summary>

* *Now before we can install this, we need to download the file! So head to https://github.com/Fadin04/SimpleCore/releases/latest to download the latest version of SimpleCore*
* *After Downloading SimpleCore, make sure that the file name is named: `SimpleCore` to avoid any script errors that may appear!*
* *After doing that, open your fivem \resources directory and find where you want to place the script. You can put it anywhere as long as you remember where it is / can find it later.*
* *After you found a place for it, go ahead and drag and drop `SimpleCore` into that folder directory.*
* *Once you've done that, head to your `server.cfg` file, or via txAdmin and add the following line to your server.cfg: `ensure SimpleCore`*
* *And just like that you're done with the installing process! By default there are some settings enabled, you can look through if you want, however, if you want to jump in and see how the script works you are welcome to do so!*

</details>

<details><summary>Setting Up Permissions</summary>

* *Now just like any other script, SimpleCore comes with permissions! Woohoo! Now to set them up, all you have to do is add a few lines to your server.cfg. Simple right, I know.*
* *Anyhoo lets get started, each command comes with it's own permission based system, for instance, you are able to add a user to 1 permission group, however the others are rejected.*

### Commands that have permission(s)

| Command / Script  | Permission Group |          ACE Permission String            |         Notes about the script / permission it has!           |
|-------------------|------------------|-------------------------------------------|---------------------------------------------------------------|
| Chat Clear script |   `chat.clear`   | `add_ace group.staff chat.clear allow`    |                           N/A                                 |
|    /fix script    |   `vehicle.fix`  | `add_ace group.staff vehicle.fix allow`   | `fixPermissions = false must be true in order to use this!`   |
|   /clean script   |  `vehicle.clean` | `add_ace group.staff vehicle.clean allow` | `cleanPermissions = false must be true in order to use this!` |
| Staff Chat script |   `chat.staff`   | `add_ace group.staff chat.staff allow`    |                           N/A                                 |
|    /dva script    |   `vehicle.dva`  | `add_ace group.staff vehicle.dva allow`   |                           N/A                                 |

* *Now all the strings that are given in the table can be altered, basically, you can change the group name to maybe be a role ID or steam ID, however, it is advised to keep the permission string the same instead of changing the permission. This way nothing breaks and everything stays simple.*

</details>

### :computer: Roleplay Commands

* /twitter
* /dispatch
* /darkweb
* /news
* /do
* /ooc
* /gme
* /me
* /ame
   * All roleplay commands listed above have the option to be configured with a CUSTOM /command via the config.lua:138-147 (Requires ``rpCommandCustom = false,`` to be true.
* /911 
* /311
* /dropweapon
* /drag

### :link: Roleplay Scripts

* Crouch Script (press CTRL)
* Hands up Script (Press X to put your hands up)
* Taser effects when tased.
* Chance of falling if you jump to many times.
* /fix command to fix your vehicles. (Can be locked via ace permissions)
* /clean command to clean your vehicles. (Can be locked via ace permissions)


### :hammer: Server Management

* /clearchat (Ace Permission)
* Player AFK Kick Script
* Server Watermark
* Server PVP
* Chat Filter
* Automatic Server Messages
* Added Blips to the map.


### :hammer_pick: Configuration Options:
* Enable / Disable RP Commands all together or specific /commands you want!
* Easy to manage config.
* Discord webhook integration
* ACE Permission config via server.cfg (Or Badger's DiscordAcePerms)