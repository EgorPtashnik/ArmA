sleep 5;
private _handle = ["ambush"] call fnc_comms;
waitUntil {sleep 1; scriptDone _handle;};

[
	player,
	"task_ambush",
	["Устройте засаду на подкрепления противника. Не оставлять ни одного в живых!", "Засада"],
	objNull,
	true,
	-1,
	true,
	"attack"
] call BIS_fnc_taskCreate;

waitUntil {
	sleep 1;
	{alive _x} count units grpReinf == 0;
};

["task_ambush", "SUCCEEDED"] call BIS_fnc_taskSetState;
["ambush-1"] call fnc_comms;
