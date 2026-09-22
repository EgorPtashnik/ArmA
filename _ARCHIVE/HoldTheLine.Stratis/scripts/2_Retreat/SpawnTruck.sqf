// Spawn units
private _classes = [
    "Atlas_B_G_Soldier_TL_ard_F",
    "Atlas_B_G_Soldier_ard_F", 
    "Atlas_B_G_Soldier_Exp_ard_F", 
    "Atlas_B_G_Medic_ard_F", 
    "Atlas_B_G_Soldier_LAT_ard_F",
    "Atlas_B_G_Soldier_ard_F",
    "Atlas_B_G_Soldier_ard_F",
    "CUP_B_Ural_Open_CDF"
];
private _grp = ["O_MrkMinotaurBlue", blufor, _classes] call EP_fnc_createGroup;
private _truck = (_grp call BIS_fnc_groupVehicles) # 0;
{ _x moveInCargo _truck } forEach units _grp select { !(_x in _truck)};

// Disembark near base and attack!
[_grp, "B_WpTruckUnload", "GETOUT"] call EP_fnc_addWaypoint;
[_grp, "O_EvacSpawnPos", "SAD"] call EP_fnc_addWaypoint;
