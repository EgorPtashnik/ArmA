// [_artiGroup, [6306.52,3375,0], "rhs_mag_3of56_35", 6] call EP_fnc_doArtilleryFire;

// getArtilleryAmmo ??

params [
	"_artillery",
	"_targetPosition",
	"_roundsNumber",
	["_magazineType", objNull],
	["_sleepRange", [0.5, 1, 1.5]]
];

if ((typeName _artillery) == "GROUP") then {
	_artillery = [_artillery, true] call BIS_fnc_groupVehicles;
};

if (isNull _magazineType) then {
	_magazineType = magazines (_artillery select 0) select 0;
};

private _isInRange = _targetPosition inRangeOfArtillery [_artillery, _magazineType];
if (!_isInRange) exitWith {};

{
	_x doArtilleryFire [ _targetPosition, _magazineType, _roundsNumber ];
	sleep ( selectRandom _sleepRange );
} forEach _artillery;

_artillery;
