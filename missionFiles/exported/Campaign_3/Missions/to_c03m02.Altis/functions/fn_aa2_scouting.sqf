// Explain tasking
["tsk_evac","CANCELED"] call BIS_fnc_taskSetState;

BIS_cleared_1 = false;
BIS_cleared_2 = false;
["Scout attack"] call BIS_fnc_to_activateUnits;

// Delete wounded and 
{deleteVehicle _x} forEach (["Wounded","Attack RP1"] call BIS_fnc_to_unitList);
{_x setPos getPos BIS_teleport} forEach units BIS_groupOscar;

private _handle = ["ta_scouting"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
saveGame;

// Dialogues
[] spawn {
	// triggered area 1
	waitUntil {sleep 1; triggerActivated trg_f1};
	["ta_scouting_logistics"] spawn BIS_fnc_missionConversations;

	// Cleared area 1
	waitUntil {sleep 1; {side _x == resistance} count (getMissionLayerEntities "Flatlands 1" select 0) <= 0};
	BIS_cleared_1 = true;
};

// Dialogues
[] spawn {
	// triggered area 2
	waitUntil {sleep 1; triggerActivated trg_f3};
	["ta_scouting_friendlies"] spawn BIS_fnc_missionConversations;

	// Cleared area 2
	waitUntil {sleep 1; {side _x == resistance} count (getMissionLayerEntities "Scout attack" select 0) <= 2};
	BIS_cleared_2 = true;
};

waitUntil {BIS_cleared_1 && BIS_cleared_2};
BIS_areaClear = true;