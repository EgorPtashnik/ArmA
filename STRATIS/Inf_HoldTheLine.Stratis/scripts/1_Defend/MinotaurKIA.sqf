// Destroy vehicle
private _minoContainer = selectRandom [
    [O_GuardLeft, "O_MrkMinotaurRed", M_TracersLeft],
    [O_GuardRight, "O_MrkMinotaurBlue", M_TracersRight]
];
private _veh = _minoContainer # 0;
private _mrk = _minoContainer # 1;
private _logic = _minoContainer # 2;
_mrk setMarkerColor "ColorGrey";
deleteVehicle _logic;
_veh enableSimulation true;
_veh setDamage 1;

sleep 5;

// Spawn Infantry + Light APC (in case minotaur red is dead)
[6, _mrk] call EP_spawnWave;
if (_mrk == "O_MrkMinotaurRed") then {
    sleep 10;
    // Spawn APC
    private _cont = [markerPos _mrk, 0, "CUP_B_M113A1_desert_USA", blufor] call BIS_fnc_spawnVehicle;
    private _apc = _cont # 0;
    [_apc, "O_MrkGorgon"] call EP_fnc_taskAttack;
    _apc limitSpeed 50;
    // Comms
    "MinoDead" call EP_fnc_missionConversations;
};
