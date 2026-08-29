params [
    "_targetVehicle",
    ["_soldCount", 9]
];

private _grp = createGroup opfor;
private _setKit = {
    removeBackpack _this;
    _this addBackpack "B_Carryall_ocamo";
    _this unlinkItem hmd _this;
};

// Create waypoints
private _wp = [_grp, _targetVehicle, "HOLD", "NORMAL", "FILE"] call EP_fnc_addWaypoint;
private _wpGetIn = [_grp, _targetVehicle, "GETIN"] call EP_fnc_addWaypoint;
_wpGetIn waypointAttachVehicle _targetVehicle;
_wp = [_grp, "O_WpEvac", "MOVE", "NORMAL", [{ true }, { EP_Evacuated = EP_Evacuated + 1 }]] call EP_fnc_addWaypoint;

// Spawn units
private _class = "O_Soldier_TL_F";
for "_i" from 1 to _soldCount do {
    if (_i != 1) then {
        _class = "O_Soldier_F";
    };
    private _unit = [_grp, _class, getMarkerPos "O_EvacSpawnPos"] call EP_fnc_createUnit;
    [_unit, "SAFE"] call EP_fnc_setAIMode;  
    _unit call _setKit;

    sleep 5;
};

// Are all units near target vehicle ?
waitUntil {sleep 1; (units _grp) findIf { !(unitReady _x) } == -1 };
_grp setCurrentWaypoint _wpGetIn;

_grp
