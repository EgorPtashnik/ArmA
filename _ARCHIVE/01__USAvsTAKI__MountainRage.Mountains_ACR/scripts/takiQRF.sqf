sleep 5;

["EP_destroySupportVehicle", "SUCCEEDED"] call BIS_fnc_missionTasks;

sleep 2;

savegame;
waitUntil {!isSaving};

"Counterattack" call BIS_fnc_missionConversations;
playMusic "CUP_A2OA_Arrowhead";

//***************
//Takistani counterattack
//***************
private _enemyUnits = ["Counterattack"] call EP_fnc_activateUnits;
private _enemyGroups = getMissionLayerEntities "Counterattack" # 2;

private ["_units", "_wp"];
EP_FSMs = [];
{
    _units = units _x;
    {
        if (vehicle _x == _x) then {
            [_x] allowGetIn false;
            _x setUnitPos "UP";
            _x disableAI "AUTOCOMBAT";
        };
    } forEach _units;

    private _veh = (_x call BIS_fnc_groupVehicles);
    {EP_FSMs pushBack (_x execFSM "FSMs\vehicleSupport.fsm")} forEach _veh;
} forEach _enemyGroups;

private _eastCasualtiesLimit = 6;

waitUntil {sleep 1; ({alive _x} count _enemyUnits) < _eastCasualtiesLimit};
