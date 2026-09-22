params [
    "_positionPrefix",
    "_count",
    ["_animation", true]
];

//Bandit classes
private _classes = ["I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_8_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_6_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_2_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_7_F"];

//Collect positions
private _positions = _positionPrefix call EP_fnc_collectVariables;
if (count _positions == 0) exitWith {systemChat "EP_fnc_createBandit: No positions left!"};

private _grp = createGroup [independent, true];
_grp setCombatBehaviour "SAFE";
_grp allowFleeing 0;

private ["_unit", "_position", "_leftPositions"];
for "_i" from 1 to _count do {
    _leftPositions = count _positions - 1;
    _position = _positions deleteAt (floor random (_leftPositions));
    _unit = _grp createUnit [selectRandom _classes, getPosATL _position, [], 0, "NONE"];
    _unit setDir direction _position;
    _unit setSkill 0.5;
	_unit setSkill ["aimingAccuracy", 0.2];
	_unit setSkill ["aimingShake", 0.2];
	_unit setSkill ["aimingSpeed", 0.2];
	_unit setSkill ["spotDistance", 0.5];
	_unit setSkill ["spotTime", 0.25];
	_unit setSkill ["courage", 1];
	_unit setSkill ["reloadSpeed", 0.5];
	_unit setSkill ["commanding", 0.5];
    
    //Delete position to not spawn there again
    deleteVehicle _position;

    //Set animation for unit
    _unit setUnitPos "UP";
    if (_animation) then {[_unit, selectRandom ["Watch", "StandArmed"]] call EF_fnc_ambientAnim};
};

_grp