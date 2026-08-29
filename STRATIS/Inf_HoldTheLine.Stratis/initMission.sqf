EP_callTigris   = compileScript ["scripts\1_Defend\_fn_CallTigris.sqf"];
EP_spawnOpfEvac = compileScript ["scripts\1_Defend\_fn_SpawnOpfEvac.sqf"];
EP_spawnWave    = compileScript ["scripts\1_Defend\_fn_SpawnWave.sqf"];
EP_spawnHeli    = compileScript ["scripts\1_Defend\_fn_SpawnHeli.sqf"];
EP_spawnOpfEvac = compileScript ["scripts\1_Defend\_fn_SpawnOpfEvac.sqf"];

//************************************************************************************************************
// MISSION SETUP
//************************************************************************************************************

// Sides setup
[ [east, [] ], [west, [] ] ] call EP_fnc_missionInit;

// Ambient warfare sounds
call EP_fnc_ambientWarfare;

// Ambient flybys
S_AmbientFlyBy = execVM "scripts\b_ambientFlyBy.sqf";

// Player setup
{ if !(isPlayer _x) then { doStop _x } } forEach units O_GrpPlayer;
player setIdentity "PlayerIdentity";

// Action to call Tigris
player setVariable ["TigrisSupportActive", true];
player setVariable [
    "TigrisSupportAction",
    [   
        player, "Gorgon-4: Destroy",
        { player getVariable ["TigrisSupportActive", false] && { (side cursorTarget == blufor) && { cursorTarget isKindOf "Air" } } },
        { spawn EP_callTigris }
    ] call EP_fnc_addAction
];

// Counter for defeated enemy waves
EP_WavesSpawned = 0;
EP_WavesUnits = [];
EP_Evacuated = 0;

// Group Names
O_GrpPlayer     setGroupId ["Gorgon-1"];
O_GrpDefenders  setGroupId ["Gorgon-2"];
O_GrpPatrol     setGroupId ["Gorgon-3"];
O_GrpTigris     setGroupId ["Gorgon-4"];
group O_Medic   setGroupId ["Combat Medic"];

//************************************************************************************************************
// OPFOR - OUTPOST SETUP
//************************************************************************************************************

// Defenders are static by default
[units O_GrpDefenders, "MIDDLE", ["PATH", false]] call EP_fnc_setAIMode;

// Disable AI for tigris to let only player request its support
(gunner O_Tigris) disableAI "ALL";

// Medic Tent action
[
    player, "Heal", { player setDamage 0 }, "a3\ui_f\data\igui\cfg\holdactions\holdaction_revive_ca.paa", 6,
    { damage player > 0 && { player distance P_MedicTent < 5 } },[], false
] call EP_fnc_addHoldAction;


//************************************************************************************************************
// OPFOR - EVAC SETUP
//************************************************************************************************************
// Lock Zamak front cargo
{
    _x lockCargo [0, true];
    _x lockCargo [1, true];
} forEach [O_Zamak_1, O_Zamak_2, O_Zamak_3];

//************************************************************************************************************
// OPFOR - EXTRACTION HELI SETUP
//************************************************************************************************************
[O_GrpExtractionHeli, false] call EP_fnc_showObjects;