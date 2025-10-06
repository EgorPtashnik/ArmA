#include "initLibrary.sqf";
#include "setup.sqf";

SM = call EP_fsm_createStateMachine;
#include "mission\stateHandlers.sqf";
#include "mission\states.sqf";

[SM, "init"] call EP_fsm_startStateMachine;

/* Type machine sounds with radio messages
	playSound "myin1";
	[ "Alpha",
	 	"Iron Gate, Alpha. Visual on objective. Marking enemy position now, over." ] call EP_fnc_showSubs;
	playSound "mynoise1";
	_time = time;
	while {time < _time + 5} do {
		playSound [selectRandom ["gm_rtty_stroke_01","gm_rtty_stroke_02","gm_rtty_stroke_03"], true];
	 	sleep selectRandom [0.06, 0.06, 0.06, 0.1, 0.3, 0.5];
	};
	playSound "myin4";
 */