BIS_decisionPoint = true;

// Tasking
sleep 5;
["tsk_bravo","SUCCEEDED"] call BIS_fnc_taskSetState;
private _handle = ["ta_superior_captured"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
_handle = ["ta_wounded_comrades"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};

// Decide tasking
[
	TRUE,
	"tsk_evac",
	[
		localize "STR_A3_TO_C03m02_tskEvacDesc",
		localize "STR_A3_TO_C03m02_tskEvacTitle",
		nil
	],
	"mrk_regroup",
	true,
	0,
	true,
	"move",
	false
] call BIS_fnc_taskCreate;

[
	TRUE,
	"tsk_support",
	[
		localize "STR_A3_TO_C03m02_tskSupportDesc",
		localize "STR_A3_TO_C03m02_tskSupportTitle",
		nil
	],
	"mrk_clearArea",
	true,
	0,
	true,
	"move",
	false
] call BIS_fnc_taskCreate;

BIS_decisionDone = true;

// Create defenses of Kappa
waitUntil {triggerActivated trg_scouting || triggerActivated trg_evac};
BIS_defenseGroup = createGroup west;
private _positions = [BIS_p1,BIS_p2,BIS_p3,BIS_p4,BIS_p5,BIS_p6];
{
	if (_forEachIndex == 6) exitWith {};
	[_x] join BIS_defenseGroup;
	_x setPosATL getPos (_positions select _forEachIndex);
	_x disableAI "path";
	deleteVehicle (_positions select _forEachIndex);
} forEach units BIS_groupNovember;

//BIS_oscar = leader BIS_groupNovember;