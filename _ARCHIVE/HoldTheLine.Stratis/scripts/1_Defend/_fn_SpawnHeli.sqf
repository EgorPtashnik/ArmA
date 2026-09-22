private _pos = (selectRandom ["B_SpawnHeli", "B_AmbFlyBy_1", "B_AmbFlyBy_2", "B_AmbFlyByA_1", "B_AmbFlyByA_2"]) call EP_fnc_getPosition;
private _container = [_pos, 0, "B_Heli_Light_01_dynamicLoadout_F", blufor] call BIS_fnc_spawnVehicle;
private _heli = _container # 0;
_heli setPylonLoadout [0, ""];
_heli setPylonLoadout [1, ""];
[
    _heli,
    ["Black",1], 
    ["AddTread_Short",0,"AddTread",1]
] call BIS_fnc_initVehicle;

[_heli, "O_MrkGorgon"] call EP_fnc_taskAttack;
