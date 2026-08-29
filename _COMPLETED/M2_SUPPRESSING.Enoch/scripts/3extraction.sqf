execVM "scripts\terminateScripts.sqf";
sleep random 5;
savegame;
terminate EP_trg_teamDead;
"EP_mrkExtr" setMarkerAlpha 1;
"taskExtraction" call EP_fnc_missionTasks;
sleep 2;
playMusic "Track_C_01";

waitUntil { sleep 1; (player distance2D (getMarkerPos "EP_mrkExtr")) < 300 };

// Send helicopter when player is near extraction zone
[group EP_extrHeli, true] call EP_fnc_showObjects;
EP_extrHeli landAt [EP_extrHelipad, "GetIn"];

waitUntil { sleep 1; player in EP_extrHeli };
["taskExtraction", "SUCCEEDED"] call EP_fnc_missionTasks;

{ _x moveInCargo EP_extrHeli } forEach units EP_playerGroup;
[EP_extrHeli, "EP_mrkCityIns"] call EP_fnc_addWaypoint;
"inHeli" call EP_fnc_showSubtitles;
sleep 5;
EP_extrHeli landAt [EP_insHelipad, "GetOut"];
"EP_mrkCityIns" setMarkerAlpha 1;
"EP_mrkCity" setMarkerAlpha 1;

sleep 30;

waitUntil { sleep 1; isTouchingGround EP_extrHeli };
savegame;
sleep 1;
"landed" call EP_fnc_showSubtitles;
"taskCity" call EP_fnc_missionTasks;
playMusic "MainTheme_F_Tank";
EP_playerGroup leaveVehicle EP_extrHeli;

{ [_x, true] call EP_fnc_showObjects } forEach ["INSERTION_UNITS"];
[EP_insEnemy, EP_playerGroup] call EP_fnc_taskAttack;

waitUntil { sleep 1; (player distance2D (getMarkerPos "EP_mrkCity")) < 380 };

{ [_x, true] call EP_fnc_showObjects } forEach ["CITY_RED_UNITS", "CITY_BLUE_UNITS"];
private _bluGroups = ((getMissionLayerEntities "CITY_BLUE_UNITS") # 2);
private _opfGroups = ((getMissionLayerEntities "CITY_RED_UNITS") # 2);

{ [_x, "EP_mrkCity"] call EP_fnc_taskAttack } forEach (_bluGroups + _opfGroups);
{ [_x, _x, true] call EP_fnc_taskAttack } forEach ( ("EP_bluCity" call EP_fnc_collectVariables) + ("EP_opfCity" call EP_fnc_collectVariables));

private _bluCount = 0;
private _bluUnits = ((getMissionLayerEntities "CITY_BLUE_UNITS") # 0);
private _bluCount = count _bluUnits;

waitUntil { sleep 1; ({alive _x} count _bluUnits) < (_bluCount * 0.3) };

{
	_x call EP_fnc_clearWaypoints;
	[_x, [4362.59,5655.23,0], "MOVE", "FULL", "CARELESS"] call EP_fnc_addWaypoint;
} forEach ((getMissionLayerEntities "CITY_BLUE_UNITS") # 2);

["taskCity", "SUCCEEDED"] call EP_fnc_missionTasks;

sleep 3;

private _handle = "cityDone" call EP_fnc_showSubtitles;

waitUntil { sleep 1; scriptDone _handle };

sleep 5;

"Win" call BIS_fnc_endMission;
