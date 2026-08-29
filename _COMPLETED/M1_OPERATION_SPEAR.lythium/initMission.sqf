/*
 *  Mission bootstrap. Runs once at mission start.
 *  Configure AI skill defaults, post-process effects, kick off mission flow.
 */

[
    [ east,       [] ],
    [ resistance, [] ]
] call ep_fnc_missionInit;

//==========================================SETUP: PLAYER==========================================//
a_grp_dagger setGroupID ["Bravo"];
town_startAssault = false;
"taskPosition" call ep_fnc_missionTasks;
"taskOutpost" call ep_fnc_missionTasks;




//==========================================SETUP: START OUTPOST==========================================//
e_grp_start call ep_fnc_taskDefend;


//==========================================SETUP: TOWN==========================================//
{ _x enableSimulation false; _x hideObject true; _x allowDamage false; _x setCaptive true } forEach (getMissionLayerEntities "town_ally_attackers" # 0);
{ _x call ep_fnc_taskDefend } forEach (getMissionLayerEntities "town_defenders" # 2);
{ _x call ep_fnc_taskPatrol } forEach (getMissionLayerEntities "town_patrols" # 2);
{ _x setPos (t_town_area call ep_fnc_getRandomPositionArea); } forEach [e_town_vehicle_1, e_town_vehicle_2, e_town_vehicle_3, e_town_vehicle_4];
e_town_sniper setUnitPos "UP";
e_town_sniper disableAI "PATH";

a_grp_inf_1 setGroupId ["Alpha-1"];
a_grp_inf_2 setGroupId ["Alpha-2"];
a_grp_town_apc_1 setGroupId ["Stryker-1"];
a_grp_town_apc_2 setGroupId ["Stryker-2"];



// Kick off the mission flow (spawned so it doesn't block init).
execVM "missionFlow\1_start.sqf";
