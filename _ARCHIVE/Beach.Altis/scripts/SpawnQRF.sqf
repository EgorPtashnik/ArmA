private _classes = [
    "CUP_O_Tigr_M_233114_PK_CSAT", 
    "Atlas_O_Soldier_R_TL_F", 
    "Atlas_O_Soldier_R_F", 
    "Atlas_O_Soldier_R_LAT_F", 
    "Atlas_O_Soldier_R_M_F", 
    "Atlas_O_Soldier_R_HG_F", 
    "Atlas_O_Soldier_R_GL_F"
];
private _spawnPos = selectRandom ("O_PosQRF" call EP_fnc_collectMarkers);
private _qrf = [_spawnPos, opfor, _classes] call EP_fnc_createGroup;
private _vehicle = (_qrf call BIS_fnc_groupVehicles) # 0;
private _vehicleCargo = [];
{ _x assignAsCargo _vehicle; _vehicleCargo pushBack _x } forEach (units _qrf select { !(_x in _vehicle)});

[_qrf, _qrf, "GETIN"] call EP_fnc_addWaypoint;
[_qrf, "O_MrkOutpost"] call EP_fnc_addWaypoint;

private _outpostPos = "O_MrkOutpost" call EP_fnc_getPosition;

[_qrf, _outpostPos, _vehicleCargo] spawn {
    params ["_qrf", "_outpostPos", "_vehicleCargo"];
    waitUntil {sleep 1; ((leader _qrf) distance2D _outpostPos) < 400 };
    { unassignVehicle _x } forEach _vehicleCargo;
};

_qrf
