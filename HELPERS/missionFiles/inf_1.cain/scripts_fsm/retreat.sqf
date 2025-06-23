savegame;
sleep 5;
private _handle = ["retreat-1"] call fnc_comms;
waitUntil {sleep 1; scriptDone _handle;};
_handle = ["retreat-2"] call fnc_comms;
waitUntil {sleep 1; scriptDone _handle;};
_handle = ["retreat-3"] call fnc_comms;
waitUntil {sleep 1; scriptDone _handle;};

"marker_heli" setMarkerAlpha 0.8;
"marker_heli" setMarkerPos getPos heli;

[
	player,
	"task_heli",
	["Используя Avenger на месте дислокации уничтожьте патрульный вертолет противника", "Вертолет"],
	objNull,
	true,
	-1,
	true,
	"destroy"
] call BIS_fnc_taskCreate;

heli hideObject false;
heli enableSimulation true;

while {alive heli} do {
	"marker_heli" setMarkerPos getPos heli;
	sleep 1;
};
deleteMarker "marker_heli";
["task_heli", "SUCCEEDED"] call BIS_fnc_taskSetState;
