/**
    Spawn group somewhere in area and start patrolling

    _unitClasses    === ARRAY, unit classes to be spawned in order
    _side           === SIDE, units side
    _areaCenter     === POSITION, center of area to spawn group
    _areaRadius     === NUMBER [DEFAULT 50], radius of area to spawn group
    _groupBehaviour === STRING [DEFAULT "SAFE"], ["CARELESS" "SAFE" "AWARE" "COMBAT" "STEALTH"], group behaviour
    _groupCombat    === STRING [DEFAULT "YELLOW"], ["BLUE" "GREEN" "WHITE" "YELLOW" "RED"], group combat mode
    _engageEnemy    === BOOLEAN [DEFAULT true], group will engage detected enemy and stop patrolling

    RETURN: CREATED GROUP
 */
params [
    "_unitClasses",
    "_side",
    "_areaCenter",
    ["_areaRadius", 50],
    ["_groupBehaviour", "SAFE"],
    ["_groupCombat", "YELLOW"],
    ["_engageEnemy", true]
];

private _position = [_areaCenter, _areaRadius] call CBA_fnc_randPos;
private _group = [_position, _side, _unitClasses] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
_group setBehaviour _groupBehaviour;
_group setCombatMode _groupCombat;

[_group] call CBA_fnc_taskPatrol;

if (_engageEnemy) then {
    _group addEventHandler ["EnemyDetected", {
        params ["_group", "_newTarget"];
        private _targetPosition = getPosATL _newTarget;
        [_group] call CBA_fnc_clearWaypoints;
        [_group, _targetPosition, 0, "SAD", "COMBAT", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;
        _group removeEventHandler [_thisEvent, _thisEventHandler];
    }];
};

_group;
