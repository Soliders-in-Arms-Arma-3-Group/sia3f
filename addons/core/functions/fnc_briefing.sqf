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

private _situationText = GET_CONFIG(situationTabText,"");
private _missionText = GET_CONFIG(missionTabText,"");
private _executionText = GET_CONFIG(execTabText,"");
private _supportText = GET_CONFIG(supportTabText,"");
private _signalText = GET_CONFIG(signalTabText,"");

{
	// ToDo: auto html formatting
} forEach [situationText, missionText, executionText, supportText, signalText];

systemChat str getMissionConfigValue ["sia3f_configuration_execTabText", "Not working!"];

player createDiaryRecord ["Diary", [GET_CONFIG(signalTabName,"Signal"), _signalText]];
player createDiaryRecord ["Diary", [GET_CONFIG(supportTabName,"Support"), _supportText]];
player createDiaryRecord ["Diary", [GET_CONFIG(execTabName,"Execution"), _executionText]];
player createDiaryRecord ["Diary", [GET_CONFIG(missionTabName,"Mission"), _missionText]];
player createDiaryRecord ["Diary", [GET_CONFIG(situationTabName,"Situation"), _situationText]];
