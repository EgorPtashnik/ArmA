BIS_apcFound = true;

private _handle = ["ta_apc_nearby"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
saveGame; 

// Task: Investigate APC
[
	TRUE,
	"tsk_apc",
	[
		localize "STR_A3_TO_C03m02_tskApcDesc",
		localize "STR_A3_TO_C03m02_tskApcTitle",
		nil
	],
	[BIS_apc,true],
	true,
	0,
	true,
	"move",
	true
] call BIS_fnc_taskCreate;

private _group = createGroup west;
[player] join _group;

// Your former team will attack the village
BIS_groupRomeo setCurrentWaypoint [BIS_groupRomeo, 4];
BIS_groupRomeo setBehaviour "AWARE";

// Near APC
waitUntil {player distance BIS_apc < 10};
[BIS_groupCrew] call BIS_fnc_TO_activateUnits;
private _handle = ["ta_apc_found"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};

// Investigate APC
waitUntil {BIS_apc getHitPointDamage "hitEngine" < 0.9};

BIS_apcRepaired = true;
["tsk_apc","SUCCEEDED"] call BIS_fnc_taskSetState;
units BIS_groupCrew join _group;

sleep 5;
{_x allowDamage true} forEach units BIS_groupCrew;

sleep 20;
BIS_apcReady = true;