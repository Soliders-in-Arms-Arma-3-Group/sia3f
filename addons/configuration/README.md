# configuration

Handles all functionality in the Eden Editor.  (Note: The expression attribute for objects is only executed on the server.  I do not fully understand this, but I *think* that it works on local MP and singleplayer, but only on the server for dedicated MP.)

## Config Definitions
This will define all of the variables that can be used with ``GET_CONFIG(var,default)``.  The following table lists the variable name, in-game name, description , and type of  every config value.  Ordered in the same way it is in-game.

``frameworkSettings`` section:
|Variable Name|In Game Name|Description|Type|Default Value|
|-------------|------------|-----------|----|-------------|
|**Mission Info**|
|missionLocationName|Mission Location Name|The location of the mission.  Used in persistent hint and intro text scroll.|String|""|
|westFactionName|Blufor Faction Name|The Blufor side's name (e.g, US Army).  Used in persistent hint and intro text scroll.|String|""|
|independentFactionName|Independent Faction Name|The Independent side's name (e.g, Altis Armed Forces).  Used in persistent hint and intro text scroll.|String|""|
|eastFactionName|Opfor Faction Name|The Opfor side's name (e.g, Kazerghastan Royal Guard).  Used in persistent hint and intro text scroll.|String|""|
|showSafestartHint|Show SafeStart Hint|If checked, the status hint will be shown by default.  If not, the status hint will be hidden by default.  Either way, it can still be toggled by the player.|Boolean|True|
|showIntroText|Show Intro Text|Shows intro text if checked, does not if it is not checked.|Boolean|True|
|**Arsenal Options**|
|disableArsenalOnRespawn|Disable Arsenal On Respawn|*Currently no functionality.*  In the future, if checked it will disable the arsenal for the player after they respawn.|Boolean|False|
|haveBasics|Add Basics|If checked, basic items such as compasses, maps, and first aid supplies will be added.|Boolean|True|
|haveCTab|Add CTab|If checked and if CTab is loaded in the mission, CTab items such as the helmet camera and rugged tablet will be added.|Boolean|True|
|haveKATMedical|KAT Medical Availability|Options are "FULL" (2), "LIMITED" (1), or "NONE" (0).  Full will add all KAT items, Limited will add some KAT items (e.g, guedel tube, chest Seal, painkillers, etc.), and None will add no KAT items.|Integer<0, 1, 2>|2|
|**ACRE Radio Options**|
|acreEnabled|ACRE Enabled|To be changed to "Radio Enabled".  If checked and if ACRE is loaded in the mission, radio ACE Options and arsenal items will be added.|Boolean|True|
|personalRadio|Personal Radio|Option of what the personal radio is (added to all units).  Options are "AN/PRC-343" (0) or "Beofeng 888S" (1).|Integer<0, 1>|0|
|handheldRadio|Handheld Radio|Option of what the handheld radio is (added to units defined in ``sia3f_acre_fnc_giveRadios``).  Options are "AN/PRC-152" (0) or "AN/PRC-148" (1).|Integer<0, 1>|0|
|manpackRadio|Manpack Radio|Option of what the handheld radio is (added to units defined in ``sia3f_acre_fnc_giveRadios``).  Options are "AN/PRC-177F" (0) or "AN/PRC-77" (1).|Integer<0, 1>|0|
|**ACE Actions Options**|
|enableTPMenu|Teleport Menu|If checked, the teleport menu will be enabled on the ACE Buttons, allowing players to teleport to any other player on their side.|Boolean|True|
|enableTPToSquad|Teleport to Squad|If checked, players can TP to their squad member (leader if available, then random-ish) via the ACE Buttons.|Boolean|True|
|enableManageKit|Kit Manager|If checked, players can save/load their kits on ACE Buttons, which are then loaded on respawn.|Boolean|True|
|enableKitAutosave|Loadout Autosave|If checked, the player's loadout will be automatically saved upon exiting the arsenal.  Will not overwrite a saved kit.|Boolean|True|
|enableLoadoutInfo|Loadout Information|Enables players to update the briefing loadout info on ACE Buttons.|Boolean|True|
|enableGoAFK|Go AFK|Enables players to go AFK via the self-interact menu.|Boolean|True|
|**Briefing Additional Settings**|
|briefORBAT|Player ORBAT|If checked, adds ORBAT information to the briefing.|Boolean|True|
|briefWeather|Weather Information|If checked, adds a weather report to the briefing.|Boolean|True|
|briefLoadout|Loadout Information|If checked, adds loadout information to the briefing.|Boolean|True|
|**On Mission Start**|
|onMissionStartCode|On Mission Start Code|Code to be executed on mission start.|STRING|""|
|**Objects**|
|isArsenal|Is Arsenal|If checked, makes the object an arsenal.|Boolean|False|
|isButton|Is Button|If checked, makes the object a button.|Boolean|False|
|role|Is Arsenal|The unit's role (e.g, "Rifleman").  Only needs to be defined on playable units.|String|""|

``hiddenConfigValues`` section:
|Variable Name|Description|Type|Default Value|
|-------------|-----------|----|-------------|
|**Initialization Values**|
|frameworkInit|Should only be true if the ``initFramework`` function has been executed successfully.|Boolean|False|
|**Roles Organization**|
|roles|Hashmap of roles and all of their properties.  Value array is ``[isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, [additional items]]``.|Hashmap|createHashMap|
|roleGroups|Hashmap of roles and all of their properties.  Value array is ``[isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, [additional items], [roles in group]]``|Hashmap|createHashMap|

## Macro Definitions
This module's custom macros are defined here.  They cannot be used outside of this module.

### SET_CONFIG(section,var,value)
Sets the [mission config value](https://community.bistudio.com/wiki/set3DENMissionAttribute) of a variable.  Should be followed by ``do3DENAction "MissionSave";`` in order to actually save the value.  Using ``GET_CONFIG`` on the variable without first saving will return the old value.

|Parameter|Description|
|-|-|
|section|The section that the config value belongs to.  As of the time of writing, this parameter can be either ``frameworkSettings`` or ``hiddenConfigValues``.|
|var|The config value to set.  See the tables above for valid values.|
|value|The value to set to ``var``.
