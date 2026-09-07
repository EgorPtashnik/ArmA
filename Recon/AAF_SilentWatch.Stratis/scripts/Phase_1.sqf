private _o_groups = [O_Compound_1_Patrol, O_Compound_1_Defenders];
Phase_1_Scripts = [];

//***********************************************************************
// SETUP 
//***********************************************************************
{ [_x, true] call EP_fnc_showObjects } forEach _o_groups;

// Trigger: At position
Trg_OverviewPos_1_Reached = spawn {
	// Condition
	private _pos = "I_MrkOverwatch_1" call EP_fnc_getPosition;
	waitUntil { sleep 1; (player distance2D _pos) < 30 };

	// Code
	"Start_2" call EP_fnc_missionConversations
};
Phase_1_Scripts pushBack Trg_OverviewPos_1_Reached;

// Trigger: See enemy at compound
Trg_OverviewPos_1_Observed = spawn {
	// Condition
	private _units = (units O_Compound_1_Patrol) + (units O_Compound_1_Defenders);
	waitUntil {
		sleep 1;
		(_units findIf { cursorTarget == _x }) != -1
	};
};
Phase_1_Scripts pushBack Trg_OverviewPos_1_Observed;

//***********************************************************************
// START 
//***********************************************************************
"Start_1" call EP_fnc_missionConversations;
sleep 5;

(group player) leaveVehicle I_Car;

// See enemy at compound
waitUntil { sleep 1; scriptDone Trg_OverviewPos_1_Observed };

"Start_1" call EP_fnc_missionTasks;
{ terminate _x } forEach Phase_1_Scripts;

// Comms
script = "Start_3" call EP_fnc_missionConversations;
waitUntil { sleep 1; scriptDone script };

// Add task
"p1_1" call EP_fnc_missionTasks;
Trg_Compound_1_KIA enableSimulation true;

// Compound 1: KIA
waitUntil { sleep 1; triggerActivated Trg_Compound_1_KIA };
"O_MrkCompound_1" setMarkerColor "ColorGrey";

sleep 5;

// Player at compound
waitUntil { sleep 1; (player distance2D markerPos "O_MrkCompound_1") < 20 };

// Handle task
"p1_1" call EP_fnc_missionTasks;

sleep 2;

// Comms
script = "p1_1" call EP_fnc_missionConversations;
waitUntil { sleep 1; scriptDone script };

sleep 2;

// Show compound 2 marker and add task
[O_Compound_2_Defenders, true] call EP_fnc_showObjects;
"O_MrkCompound_2" setMarkerAlpha 1;
"p1_2" call EP_fnc_missionTasks;

// Inspected laptop
F_Intel = false;
waitUntil { sleep 1; F_Intel };

"p1_2" call EP_fnc_missionTasks;
"O_MrkCompound_3" setMarkerAlpha 1;
"O_MrkCompound_2" setMarkerColor "ColorGrey";

sleep 1;

// Comms
script = "p1_2" call EP_fnc_missionConversations;
waitUntil { sleep 1; scriptDone script };
