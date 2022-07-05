#include "script_component.hpp"

/*
 * Author: Siege
 * Checks if a mod is currently loaded.
 * 
 * Arguments:
 * 0: Mod to check (i.e, this mod would be "@sia3f", CBA would be "@CBA_A3") <STRING>
 *
 * Return Value:
 * True if mod is loaded, False if not <BOOL>
 *
 * Example:
 * "@sia3f" call sia3f_core_fnc_checkModPresence
*/

if ( !params [["_addon", "", [""]]] ) then { ERROR("checkModPresence invalid params"); };

private _hasMod = false; // exitWith doesn't work in the forEach context, so can't return true in the middle of forEach

{
	if (_x # 1 == _addon) exitWith { _hasMod = true; };
} forEach getLoadedModsInfo;

TRACE_2("checkModPresence returned",_addon,_hasMod);
_hasMod
