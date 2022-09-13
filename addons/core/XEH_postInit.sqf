#include "script_component.hpp"

call FUNC(loadoutNotes);
call FUNC(briefing);
call FUNC(orbat);
((GET_CONFIG(showStatusHint,true))) call FUNC(safeStartInit);