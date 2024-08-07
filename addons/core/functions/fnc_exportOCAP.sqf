#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Exports OCAP data
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_exportOCAP
*/

LOG_FUNC_START;

if (isNil "OCAP_recorder_fnc_exportData") exitWith {
	LOG_FUNC_END_ERROR("OCAP_recorder_fnc_exportData function not found");
};

private _weekday = [systemTime] call CBA_fnc_weekDay;
private _outcome = "Mission Completed";
private _opType = "UNK";

if (!isNil QGVAR(missionLost)) then {
	_outcome = "Mission Failed";
};

if (_weekday >= 0) then {
	switch (_weekday) do {
		case 0: { _opType = "MAIN OP"; }; // sunday
		case 5: { _opType = "SIDE OP"; }; // friday
		default { _opType = "MISC"; }; // any other day
	};
} else {
	ERROR("Failed to fetch weekday");
};

TRACE_2("ocap export data",_weekday,_outcome,_opType);
[_side, _outcome, _opType] call OCAP_recorder_fnc_exportData;

LOG_FUNC_END;
