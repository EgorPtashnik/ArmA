pf_comms = compile preprocessFileLineNumbers "fnc\comms.sqf";
pf_subs = compile preprocessFileLineNumbers "fnc\subtitles.sqf";
pf_task = compile preprocessFileLineNumbers "fnc\taskHandler.sqf";

#include "initBriefing.sqf";

player action ["WeaponOnBack", player];

// flags
p_contact = false;
p_carStolen = false;
p_helpEcho = false;
p_echoRetreat = false;

// random car position
private _carPos = ["carPos_0", "carPos_1", "carPos_2", "carPos_3", "carPos_4", "carPos_5", "carPos_6", "carPos_7", "carPos_8", "carPos_9", "carPos_10", "carPos_11"] call BIS_fnc_selectRandom;
car setPos getMarkerPos _carPos;
car setDir markerDir _carPos;

// random player position
private _position = [[getMarkerPos "enemyBase", 250, 250, 0, false], true] call CBA_fnc_randPosArea;
player setPos _position;

// Set direction to the enemy base and set start marker
private _direction = getDir player + (player getRelDir getMarkerPos "enemyBase");
player setDir _direction;

"start" setMarkerPos _position;
"start" setMarkerDir _direction;

{_x enableSimulation false; _x hideObject true;} forEach units grpEcho;
{_x enableSimulation false; _x hideObject true;} forEach units grpAttackEcho;

#include "intro.sqf";
