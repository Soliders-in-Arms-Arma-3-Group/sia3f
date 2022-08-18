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

LOG("briefing started");

private _situationText = [GET_CONFIG(situationTabText,"")] call FUNC(formatBriefing);
private _missionText = [GET_CONFIG(missionTabText,"")] call FUNC(formatBriefing);
private _executionText = [GET_CONFIG(execTabText,"")] call FUNC(formatBriefing);
private _supportText = [GET_CONFIG(supportTabText,"")] call FUNC(formatBriefing);
private _signalText = [GET_CONFIG(signalTabText,"")] call FUNC(formatBriefing);
TRACE_5("briefing content",_situationText,_missionText,_executionText,_supportText,_signalText);

player createDiaryRecord ["Diary", [GET_CONFIG(signalTabName,"Signal"), _signalText]];
player createDiaryRecord ["Diary", [GET_CONFIG(supportTabName,"Support"), _supportText]];
player createDiaryRecord ["Diary", [GET_CONFIG(execTabName,"Execution"), _executionText]];
player createDiaryRecord ["Diary", [GET_CONFIG(missionTabName,"Mission"), _missionText]];
player createDiaryRecord ["Diary", [GET_CONFIG(situationTabName,"Situation"), _situationText]];

LOG("briefing finished");
