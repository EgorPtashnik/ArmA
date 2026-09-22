//**********************************
//Wait for drivers to be at position
//**********************************
private _drivers = ([EP_Convoy, true] call BIS_fnc_groupVehicles) apply {driver _x};
waitUntil {(_drivers findIf {!unitReady _x}) == -1};

//**********************************
//Activate units
//**********************************
["Taki Roadblock", "Taki Base", EP_Alpha] call EP_fnc_activateUnits;
trg_BaseSeized enableSimulation true;


//**********************************
//Squash units
//**********************************
private _units = getMissionLayerEntities "Assault Group" # 0;
_units joinSilent EP_Bravo1;
{EP_Bravo1 leaveVehicle _x} forEach ([EP_Bravo1, true] call BIS_fnc_groupVehicles);

//**********************************
//Send attack
//**********************************
//Bravo-1
{_x disableAI "AUTOCOMBAT"} forEach units EP_Bravo1;
_wp = EP_Bravo1 addWaypoint [markerPos "wpBravo1_1", -1];
_wp = EP_Bravo1 addWaypoint [markerPos "wpBravo1_2", -1];
_wp = EP_Bravo1 addWaypoint [markerPos "wpBravo1_3", -1];
_wp = EP_Bravo1 addWaypoint [markerPos "wpConvoy_6", -1];
_wp setWaypointCombatMode "RED";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointSpeed "FULL";

//Bravo-2
{_x disableAI "AUTOCOMBAT"} forEach units EP_Bravo2;
{EP_Bravo2 leaveVehicle _x} forEach ([EP_Bravo2, true] call BIS_fnc_groupVehicles);
_wp = EP_Bravo2 addWaypoint [markerPos "wpBravo2_1", -1];
_wp = EP_Bravo2 addWaypoint [markerPos "wpBravo2_2", -1];
_wp = EP_Bravo2 addWaypoint [markerPos "wpConvoy_6", -1];
_wp setWaypointCombatMode "RED";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointSpeed "FULL";

waitUntil {vehicle player == player};
["EP_prepare", "SUCCEEDED"] call BIS_fnc_missionTasks;
["EP_assault", "ASSIGNED"] call BIS_fnc_missionTasks;

sleep 5;

savegame;
