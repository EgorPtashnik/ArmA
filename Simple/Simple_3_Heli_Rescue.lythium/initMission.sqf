/*
	"colorCorrections" ppEffectEnable true; 
	"colorCorrections" ppEffectAdjust [0.85, 0.95, 0, [0.1, 0.15, 0.2, 0], [0.85, 0.85, 0.9, 0.6], [0.6, 0.7, 0.8, 0]]; 
	"colorCorrections" ppEffectCommit 0;
*/

private ["_units"];

//Setup AI skill
{  
	_x unlinkItem hmd _x;
    _x setskill 0.25;  
    _x setskill ["aimingAccuracy",0.05];  
    _x setskill ["aimingShake",0.05];  
    _x setskill ["aimingSpeed",0.05];  
    _x setskill ["spotDistance",0.5];  
    _x setskill ["spotTime",0.25];  
    _x setskill ["courage",0.25];  
    _x setskill ["reloadSpeed",0.5];  
    _x setskill ["commanding",0.5];  
    _x allowFleeing 0;  
  
} forEach allUnits;

//Markers
{_x setMarkerAlpha 0} forEach ["EP_MARKER_HELI_CRASH_1", "EP_MARKER_HELI_CRASH_2", "EP_MARKER_HELI_CRASH_3"];

//Player identity
EP_PLAYER setName ["Taylor Mosence", "Taylor", "Mosence"];
EP_PLAYER setRank "CORPORAL";
EP_PLAYER action ["WeaponOnBack", EP_PLAYER];

//Groups
group EP_PLAYER setGroupId ["Bearclaw-6"];
EP_GROUP_RESCUE setGroupId ["Fox"];

//Setup loadout
_units = [EP_PLAYER] + getMissionLayerEntities "Layer_Start_Base_Units" # 0;
{["SOLDIER", _x] call EP_fnc_loadout} forEach _units;

//Initial task
"PATROL" call BIS_fnc_missionTasks;

EP_MISSION_STARTED = true;

[] call BIS_fnc_jukebox;
