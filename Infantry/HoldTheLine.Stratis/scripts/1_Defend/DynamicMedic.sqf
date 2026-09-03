private _checkUnits = [O_GrpPlayer, O_GrpDefenders, O_GrpPatrol] call EP_fnc_collectUnits;

private _woundedUnitIndex = -1;
private _targetUnit = objNull;

//************************************************************************************************************
// MAIN LOOP
//************************************************************************************************************

while { sleep 5; true } do {

    if (!alive O_Medic) exitWith {};

    // Medic is the priority
    if (damage O_Medic > 0) then {
        O_Medic action ["HealSoldierSelf", O_Medic];
        waitUntil { unitReady O_Medic }; 
    };

    _woundedUnitIndex = _checkUnits findIf { damage _x > 0.4 };

    // If unit is wounded => heal him
    if (_woundedUnitIndex != -1) then {
        _targetUnit = _checkUnits # _woundedUnitIndex;


        while { sleep 10; (O_Medic distance _targetUnit) > 5 } do {
            // If unit is dead - remove it from array
            if (!alive _targetUnit) exitWith {
                _checkUnits deleteAt _woundedUnitIndex
            };

            O_Medic doMove (_targetUnit call EP_fnc_getPosition);
        };

        if (alive _targetUnit) then {
            O_Medic action ["HealSoldier", _targetUnit];
        };
    };

    if ( (O_Medic distance2D player) > 40 ) then {
        O_Medic doMove (player call EP_fnc_getPosition);
    }
    
};