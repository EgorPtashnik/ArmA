private _handle = nil;
private _townVehicles = [e_town_vehicle_1, e_town_vehicle_2, e_town_vehicle_3, e_town_vehicle_4];

"taskVehicles" call ep_fnc_missionTasks;
sleep 2;
"taskCall" call ep_fnc_missionTasks;
[player, "AlphaGo"] call BIS_fnc_addCommMenuItem;

sleep 3;

{
	if (alive _x) then {
		_x addEventHandler ["Killed", { "vehicleDestroyed" spawn ep_fnc_showSubtitles; }];
	}
} forEach _townVehicles;

savegame;
playMusic "QGTrack3";


//=====================================LOOP=====================================//
private _vehiclesDestroyed = false;

while { true } do {

	if (!_vehiclesDestroyed && (_townVehicles findIf { alive _x || canMove _x }) == -1) then {
		_vehiclesDestroyed = true;
		["taskVehicles", "SUCCEEDED"] call ep_fnc_missionTasks;
	};

	if (town_startAssault) exitWith {

		if (!_vehiclesDestroyed) then { ["taskVehicles", "CANCELED"] call ep_fnc_missionTasks };

		_handle = "town_start" call ep_fnc_showSubtitles;
		waitUntil { sleep 1; scriptDone _handle };
		sleep 1;
		["taskCall", "SUCCEEDED"] call ep_fnc_missionTasks;

		execVM "missionFlow\3_town_assault.sqf"
	};

	sleep 1;

};