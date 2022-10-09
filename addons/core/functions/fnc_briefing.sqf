#include "script_component.hpp"

/*
 * Author: Siege
 * Adds all briefing elements (situation, mission, execution, support, signal) to the player's diary with automatic html formatting.  Execute locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_briefing
*/

LOG_FUNC_START;
private _situationText = [GET_CONFIG(situationTabText,"")] call FUNC(formatBriefing);
private _missionText = [GET_CONFIG(missionTabText,"")] call FUNC(formatBriefing);
private _executionText = [GET_CONFIG(execTabText,"")] call FUNC(formatBriefing);
private _supportText = [GET_CONFIG(supportTabText,"")] call FUNC(formatBriefing);
private _signalText = [GET_CONFIG(signalTabText,"")] call FUNC(formatBriefing);

{
	if (_x == "") then { ERROR_MSG_1("%1 briefing text not found.",[ARR_5("Situation","Mission","Execution","Support","Signal")] select _forEachIndex); };
} forEach [_situationText, _missionText, _executionText, _supportText, _signalText];

TRACE_5("briefing content",_situationText,_missionText,_executionText,_supportText,_signalText);

player createDiaryRecord ["Diary", [GET_CONFIG(signalTabName,"Signal"), _signalText]];
private _record = player createDiaryRecord ["Diary", [GET_CONFIG(supportTabName,"Support"), _supportText]];
player createDiaryRecord ["Diary", [GET_CONFIG(execTabName,"Execution"), _executionText]];
player createDiaryRecord ["Diary", [GET_CONFIG(missionTabName,"Mission"), _missionText]];
player createDiaryRecord ["Diary", [GET_CONFIG(situationTabName,"Situation"), _situationText]];

private _vehicles = EGVAR(configuration,supportObjects);
if (isNil "_vehicles") exitWith { LOG_FUNC_END_ERROR("nil _vehicles"); };

_supportText = _supportText + "<br></br><br></br><t color='#ff5733'>Vehicle Assets:</t><br></br><br></br>" + ([_vehicles, _record] call FUNC(vehicleInfo));
player setDiaryRecordText [["Diary", _record], [GET_CONFIG(supportTabName,"Support"), _supportText]];

LOG_FUNC_END;
