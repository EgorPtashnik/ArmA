//**************************
//Send transport cars back
//**************************
private _group = createGroup [WEST, true];
private _transportCars = ([EP_Convoy, true] call BIS_fnc_groupVehicles) select {!canFire _x};
{_group addVehicle _x; crew _x joinSilent _group} forEach _transportCars;

_wp = _group addWaypoint [markerPos "wpConvoy_2", -1];
_wp setWaypointStatements ["true", toString (
{
    {
        if (vehicle _x != _x) then {deleteVehicle vehicle _x};
        deleteVehicle _x;
    } forEach thisList;
})];

//**************************
//Send combat cars attack
//**************************
EP_Convoy setSpeedMode "LIMITED";
EP_Convoy setCombatMode "RED";
EP_ConvoyDone = false;
{_x disableAI "AUTOCOMBAT"} forEach units EP_Convoy;
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_4", -1];
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_5", -1];
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_6", -1];
_wp setWaypointStatements ["true", "EP_ConvoyDone = true;"];
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_6", -1];
_wp setWaypointType "SAD";

//Unstuck check
spawn {
    private _cars = ([EP_Convoy, true] call BIS_fnc_groupVehicles) select {canFire _x};
    while {sleep 10; !triggerActivated trg_BaseSeized || !EP_ConvoyDone} do {
        {
            if (vehicle _x != vehicle leader EP_Convoy && {unitReady driver _x && speed _x < 5 && vehicle _x != vehicle leader EP_Convoy}) then {
                driver _x doFollow leader EP_Convoy
            };

            if (vehicle _x == vehicle leader EP_Convoy && {unitReady driver _x && speed _x < 5}) then {
                driver _x doMove waypointPosition ([EP_Convoy, currentWaypoint EP_Convoy]);
            };
        } forEach _cars;
    };
};

