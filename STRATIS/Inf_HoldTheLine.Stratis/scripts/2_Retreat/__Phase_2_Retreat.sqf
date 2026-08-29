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
[O_GrpExtractionHeli, false] call EP_fnc_showObjects;
[O_GrpExtractionHeli, _targetPos] call EP_fnc_addWaypoint;


// Heli 200m away from task pos
waitUntil { sleep 1; ( (leader O_GrpExtractionHeli) distance2D _targetPos) < 200 };


//************************************************************************************************************
// DESTROY HELI + COMMS
//************************************************************************************************************
[O_ExtractionHeli] call BIS_fnc_neutralizeUnit;
