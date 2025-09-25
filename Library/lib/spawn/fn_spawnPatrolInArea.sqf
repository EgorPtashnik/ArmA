params [
    "_side",
    "_units",
    "_areaVar"
];

private _position = _areaVar call BIS_fnc_randomPosTrigger;
private _group = [ _position, _side, _units ] call BIS_fnc_spawnGroup;


