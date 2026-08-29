params [
    ["_toSpawn", 6],
    ["_spawnPos", true],
    ["_classes", [
        "Atlas_B_G_Soldier_SL_ard_F", 
        "Atlas_B_G_Soldier_LAT_ard_F", 
        "Atlas_B_G_Soldier_GL_ard_F", 
        "Atlas_B_G_HeavyGunner_ard_F", 
        "Atlas_B_G_Soldier_ard_F", 
        "Atlas_B_G_Soldier_AR_ard_F"
    ]]
];

if (_spawnPos isEqualType true) then {
    _spawnPos = selectRandom (["B_SpawnWave", true] call EP_fnc_collectMarkers);
} else {
    _spawnPos = _spawnPos call EP_fnc_getPosition;
};

private _spawnClasses = [_classes, _toSpawn] call EP_fnc_getRandomArray;

private _grp = [_spawnPos, blufor, _spawnClasses] call EP_fnc_createGroup;
[_grp, "O_MrkGorgon", "AWARE", "FULL"] call EP_fnc_taskAttack;

EP_WavesUnits append (units _grp);
EP_WavesSpawned = EP_WavesSpawned + 1;

_grp