/*
	"colorCorrections" ppEffectEnable true; 
	"colorCorrections" ppEffectAdjust [0.85, 0.95, 0, [0.1, 0.15, 0.2, 0], [0.85, 0.85, 0.9, 0.6], [0.6, 0.7, 0.8, 0]]; 
	"colorCorrections" ppEffectCommit 0;
*/

// Hide Units
(getMissionLayerEntities "Layer_Reinforcements" # 0) call EP_fnc_hideUnits;
(getMissionLayerEntities "LAYER_COUNTERATTACK"  # 0) call EP_fnc_hideUnits;
(getMissionLayerEntities "LAYER_SUPPLY_BASE_DEFENDER"  # 0) call EP_fnc_hideUnits;

// Groups
{_x allowFleeing 0; _x deleteGroupWhenEmpty true} forEach (getMissionLayerEntities "Layer_1_Units" # 2);
{_x allowFleeing 0; _x deleteGroupWhenEmpty true} forEach (getMissionLayerEntities "Layer_Reinforcements" # 2);
{_x allowFleeing 0; _x deleteGroupWhenEmpty true} forEach (getMissionLayerEntities "LAYER_COUNTERATTACK" # 2);

(group o_BMP) setGroupId ["Меч-1"];
(group o_BTR) setGroupId ["Меч-2"];
g_Reinf_Infantry setGroupId ["Меч-3"];

// Markers
"MARKER_ATTACK_ARROW" setMarkerAlpha 0;
"MARKER_SUPPLY_BASE" setMarkerAlpha 0;
"MARKER_SUPPLY_BASE_DONE" setMarkerAlpha 0;

// Player Group
private ["_playerGroup"];
_playerGroup = group EP_Player;
_playerGroup setGroupId ["Кинжал"];
{
	if !(isPlayer _x) then {
		_x allowFleeing 0;
		_x setUnitRank "SERGEANT";
	}
} forEach units _playerGroup;

// Sling Load
o_Heli_2 setSlingLoad o_BMP;
o_Heli_3 setSlingLoad o_BTR;

// Initial Task
"AA_POST" call BIS_fnc_missionTasks;

// Intro
enableRadio false;
private ["_shotIcon", "_shotIconColor", "_shotIconPos"];
_shotIcon = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
_shotIconColor = west call BIS_fnc_sideColor;
_shotIconPos = getMarkerPos "MARKER_AA_POST";
[[2534.92,3845.2,0], "Аванпост США, Тихий Океан", 200, 200, random 360, 1, [
	[_shotIcon, _shotIconColor, _shotIconPos, 2, 2, 0]
]] call BIS_fnc_establishingShot;
