private _startPos = [];
private _endPos = [];
private _classes = [
    "B_Heli_Light_01_dynamicLoadout_F", 
    "B_Heli_Transport_03_unarmed_F", 
    "B_Heli_Transport_01_unarmed_F", 
    "EF_B_AH99J_NATO", 
    "B_Plane_CAS_01_dynamicLoadout_F", 
    "B_VTOL_01_infantry_F"
];
private _startPositions = ("B_AmbFlyBy" call EP_fnc_collectMarkers);
private _startPositionsAlt = ("B_AmbFlyByA" call EP_fnc_collectMarkers);

while { true } do {
    _startPos = selectRandom (_startPositions + _startPositionsAlt);

    if (_startPos in _startPositions) then {
        _endPos = selectRandom _startPositionsAlt;
    } else {
        _endPos = selectRandom _startPositions;
    };

    [_startPos, _endPos, (selectRandom _classes), 300, "FULL", blufor] call EP_fnc_ambientFlyBy;
    sleep (random [30, 90, 180]);
};
