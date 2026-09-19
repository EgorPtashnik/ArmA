["taskInsertion", "SUCCEEDED"] call EP_fnc_missionTasks;
"taskArty" call EP_fnc_missionTasks;

sleep 5;
savegame;
sleep 2;
playMusic "Track12_StageC_action";

waitUntil { sleep 1; player distance2D (getMarkerPos "EP_mrkBase") < 300 };
private _handle = "nearBase" call EP_fnc_showSubtitles;
waitUntil { sleep 1; scriptDone _handle };
savegame;

private _artyVehicles = ("EP_baseArty" call EP_fnc_collectVariables);


while { true } do {
	// FAIL - Casualties
	if (EP_flag_teamKIA) exitWith {
		_handle = "casualties" call EP_fnc_showSubtitles;
		waitUntil { sleep 1; scriptDone _handle };
		["taskArty", "FAILED"] call EP_fnc_missionTasks;
		"taskExtraction" call EP_fnc_missionTasks;
		sleep 30;
		["FailCasualties", false, true, false] call BIS_fnc_endMission;
	};

	// Arty KIA
	if ( ({!alive _x || !canMove _x} count _artyVehicles) == 4) exitWith {
		execVM "scripts\base_spawnAlarmTroops.sqf";
		deleteVehicle EP_trg_baseAlarm;
		sleep 2;
		["taskArty", "SUCCEEDED"] call EP_fnc_missionTasks;
		sleep 5;
		_handle = "artyKIA" call EP_fnc_showSubtitles;
		waitUntil { sleep 1; scriptDone _handle };
		execVM "scripts\3extraction.sqf";
	};

	sleep 5;
};