#include "script_component.hpp"

#define LB (_display displayCtrl 10)

/*
 * Author: R3vo, Modified by McKendrick
 * Handles the teleport GUI functionality. Needs to run in scheduled environment. Will also show a global message in side channel.

 * Arguments:
 * 0: Mode, can be:
 *	"onLoad" (Internal use)
 * 	"teleport" (Internal use)
 * 	"disableGlobalMessage" - Disable or enable global message
 * 	"addActions" - Will add actions to given objects globally
 * 	"setCustomLocations" - Set the custom locations.
 * 		Each custom location is an array in format
 * 		0: STRING - Name displayed in the GUI
 * 		1: ARRAY ([x, y] or [x, y, z]), OBJECT, GROUP, STRING (marker or variable name containing an object), LOCATION
 * 		2: ARRAY - (optional, default [1, 1, 1, 1]) Color in format RGBA. Can be used to highlight the entry in the list
 * 	<STRING>
 * 1: Parameters according to mode <ARRAY|BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Examples:
 * ["setCustomLocations", [["MHQ", MHQ, [1, 0, 0, 1]]]] call sia3f_core_fnc_teleport; // Set custom locations
 *
 * ["enableGlobalMessage", false] call sia3f_core_fnc_teleport; // Disable global message
 *
 * ["addActions", [TPD_1, MHQ]] call sia3f_core_fnc_teleport; // Add actions to given objects for all players
 *
 * [
 * 	"setCustomLocations",
 * 		[
 * 			["MHQ No. 0", "MHQ_0", [random 1, random 1, random 1, 1]],
 * 			["MHQ No. 1", "MHQ_1", [random 1, random 1, random 1, 1]],
 * 			["MHQ No. 2", "MHQ_2", [random 1, random 1, random 1, 1]],
 * 			["MHQ No. 3", "MHQ_3", [random 1, random 1, random 1, 1]]
 * 		]
 * 	] call sia3f_core_fnc_teleport; //Add 4 custom locations in form of markers.
*/

disableSerialization;
params ["_mode", "_parameters"];
LOG_FUNC_START;

switch (_mode) do {
	case "onLoad": {
		private _display = uiNamespace getVariable [QGVAR(TPD_Display), displayNull];
		private _ctrlLB = LB;
		private _customLocs = missionNamespace getVariable [QGVAR(TDP_CustomLocations), []];
		while { !isNull _display } do {
			lbClear _ctrlLB;
			((units side player) select { alive _x && _x != player && isPlayer _x && vehicle _x == _x }) apply {
				private _index = _ctrlLB lbAdd name _x;
				_ctrlLB lbSetData [_index, str position _x];
				_ctrlLB lbSetTextRight [_index, format ["(%2 m) - Grid: %1", mapGridPosition _x, round (player distance _x)]];
			};
			_customLocs apply {
				_x params [
					["_name", "", [""]],
					["_pos", [0, 0, 0], [objNull, grpNull, locationNull, [], ""]],
					["_color", [1, 1, 1, 1], [[]], 4]
				];
				_pos = _pos call BIS_fnc_position;
				private _index = _ctrlLB lbAdd _name;
				_ctrlLB lbSetData [_index, str _pos];
				_ctrlLB lbSetTextRight [_index, format ["(%2 m) - Grid: %1", mapGridPosition _pos, round (player distance _pos)]];
				_ctrlLB lbSetColor [_index, _color];
			};
			sleep 2;
		};
	};

	case "teleport": {
		private _display = uiNamespace getVariable [QGVAR(TPD_Display), displayNull];
		private _newPos = LB lbData (lbCurSel LB);

		//Exit if nothing was selected or position could not be retrieved
		if (_newPos == "") exitWith {};
		_newPos = parseSimpleArray _newPos;

		//Fade out
		_display closeDisplay 0;
		2 fadeSound 0;
		cutText ["", "BLACK OUT", 2];
		sleep 2;

		//Fade in
		cutText ["", "BLACK IN", 2];
		player setPos (_newPos getPos [5, random 360]);
		[["You arrived at the designated location."], [format ["Grid: %1", mapGridPosition player]]] spawn BIS_fnc_EXP_camp_SITREP;
		2 fadeSound 1;

		//MP Message
		if (missionNamespace getVariable [QGVAR(TDP_EnableGlobalMessage), false]) then
		{
			[[side player, "HQ"], format ["%1 arrived in the AO.", name player]] remoteExec ["sideChat"];
		};
	};

	case "enableGlobalMessage": {
		if !(_parameters isEqualType true) exitWith { ERROR("TPD global message state could not be set"); };
		missionNamespace setVariable [QGVAR(TDP_EnableGlobalMessage), _parameters, true];
	};

	case "setCustomLocations": {
		missionNamespace setVariable [QGVAR(TDP_CustomLocations), _parameters, true];
	};

	case "addActions": {
		if !(_parameters isEqualTypeAll objNull) exitWith { ERROR("TPD Actions could not be added"); };
		TRACE_1("addActions parameters",_parameters);
			if ("@ace" call FUNC(checkModPresence)) then { 
				private _action = ["TPD", "Open Teleport Menu", "\a3\modules_f_curator\data\portraitobjectivemove_ca.paa", { [] spawn { findDisplay 46 createDisplay QGVAR(TPD_Teleport) } }, { true }] call ace_interact_menu_fnc_createAction;
				{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach _parameters;
			} else {
				{ _x addAction [_x, ["<img image='\a3\modules_f_curator\data\portraitobjectivemove_ca.paa'/> Select Teleport Location", { findDisplay 46 createDisplay QGVAR(TPD_Teleport) }, nil, 6, true, true, "", "true", 4]] } forEach _parameters;
			};
	};

	case "previewPosition": {
		private _display = uiNamespace getVariable [QGVAR(TPD_Display), displayNull];
		private _newPos = LB lbData (lbCurSel LB);

		//Exit if nothing was selected or position could not be retrieved
		if (_newPos == "") exitWith {};
		_newPos = parseSimpleArray _newPos;
		openMap true;
		[2, 0.05, _newPos] call BIS_fnc_mapAnimAdd;
	};
};

TRACE_1("mode executed",_mode);
LOG_FUNC_END;
