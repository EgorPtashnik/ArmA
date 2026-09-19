//************************************************************************************************************
// PREPARATIONS
//************************************************************************************************************
player removeAction (player getVariable "TigrisSupportAction");
player setVariable ["TigrisSupportActive", false];
(gunner O_Tigris) enableAI "ALL";
O_GrpTigris leaveVehicle O_Tigris;
terminate S_DynamicMedic;
terminate S_AmbientFlyBy;

private _aliveUnits = ([O_GrpDefenders, O_GrpPatrol, O_Medic, O_GrpTigris] call EP_fnc_collectUnits) select { alive _x };
[_aliveUnits, "AUTO", ["PATH", true]] call EP_fnc_setAIMode;
sleep 2;

_aliveUnits join player;

sleep 2;

savegame;

sleep 2;

"Retreat" call EP_fnc_missionTasks;
private _targetPos = "O_EvacSpawnPos" call EP_fnc_getPosition;

// Player 500m away from task pos
waitUntil {sleep 1; (player distance2D _targetPos) < 500 };


//************************************************************************************************************
// SPAWN TRUCK WITH INFANTRY IF MINO BLUE KIA
//************************************************************************************************************
if ( (getMarkerColor "O_MrkMinotaurBlue") == "ColorGrey") then {
    execVM "scripts\2_Retreat\SpawnTruck.sqf";
};

private _handle = "NearBase" call EP_fnc_missionConversations;
waitUntil {sleep 1; scriptDone _handle };

sleep 5;
savegame;


// Player 50m away from task pos
waitUntil { sleep 1; (player distance2D _targetPos) < 50 };


//************************************************************************************************************
// CHANGE TASK AND SEND EXTRACTION HELI
//************************************************************************************************************
["Retreat", true] call EP_fnc_missionTasks;
"Hold" call EP_fnc_missionTasks;
[O_GrpExtractionHeli, true] call EP_fnc_showObjects;
[O_GrpExtractionHeli, _targetPos] call EP_fnc_addWaypoint;

// Spawn enemy
private _enemyBaseGrp = [15, "O_SpawnBaseEnemy"] call EP_spawnWave;
_enemyBaseGrp call EP_fnc_clearWaypoints;
[_enemyBaseGrp, "O_EvacSpawnPos", "AWARE", "FULL"] call EP_fnc_taskAttack;

// Heli 200m away from task pos
waitUntil { sleep 1; ( (leader O_GrpExtractionHeli) distance2D _targetPos) < 200 };


//************************************************************************************************************
// DESTROY HELI + COMMS
//************************************************************************************************************
while { sleep 10; alive O_ExtractionHeli } do {
    [O_ExtractionHeli] call BIS_fnc_neutralizeUnit;
};

sleep 2;

["Retreat", "CANCELED"] call EP_fnc_missionTasks;

sleep 2;

//************************************************************************************************************
// EXTRACT AT THE BEACH
//************************************************************************************************************
_handle = "HeliDestroyed" call EP_fnc_missionConversations;
waitUntil {sleep 1; scriptDone _handle };

// Show task and marker
["Hold", "CANCELED"] call EP_fnc_missionTasks;
"RetreatBoat" call EP_fnc_missionTasks;
"O_MrkExtractionBoat" setMarkerAlpha 1;

// Spawn beach guards
private _toSpawn = [
    [
        "Atlas_B_G_Soldier_SL_ard_F", 
        "Atlas_B_G_Soldier_LAT_ard_F", 
        "Atlas_B_G_Soldier_GL_ard_F", 
        "Atlas_B_G_HeavyGunner_ard_F", 
        "Atlas_B_G_Soldier_ard_F", 
        "Atlas_B_G_Soldier_AR_ard_F"
    ],
    12
] call EP_fnc_getRandomArray;
private _enemyGrp = ["O_SpawnBeachEnemy", blufor, _toSpawn] call EP_fnc_createGroup;
[_enemyGrp, "COMBAT", "RED"] call EP_fnc_setAIMode;
[_enemyGrp, 0, false, 300, 8] call EP_fnc_taskPatrol;

waitUntil { sleep 1; (player distance2D (markerPos "O_MrkExtractionBoat") < 150) };
[O_GrpExtractionBoat, true] call EP_fnc_showObjects;

waitUntil { EP_Extracted || (player distance2D O_ExtractionBoat) < 100 };

_handle = "Extracted" call EP_fnc_missionConversations;
waitUntil { scriptDone _handle};

"Win" call BIS_fnc_endMission;

