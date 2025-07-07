/**
	fn_spawnAndAttack = compile preprocessFileLineNumbers "scripts\fn_spawnAndAttack.sqf";

	_spawnPosition - marker or position array
	_side - SIDE:
		west
		east
		independent
		civilian
		sideFriendly (friendly to all)
		sideEnemy (enemy to all)
	_toSpawn - classes array

	["spawnMarkerName", independent, [I_C_Soldier_Bandit_7_F], "attackMarkerName"] call fn_spawnAndAttack;

 */
params [
	"_spawnPosition",
	"_side",
	"_toSpawn",
	"_attackPosition",
	["_searchRadius", 100],
	["_relPositions", []],
	["_skillRange", []],
	["_ammoRange", []],
	["_randomControls", [-1, 1]],
	["_azimuth", 0],
	["_precisePos", true]
];

if (typeName _spawnPosition == "STRING") then {
	_spawnPos = getMarkerPos _spawnPosition;
} else {
	_spawnPos = _spawnPosition;
};

if (typeName _attackPosition == "STRING") then {
	_attackPos = getMarkerPos _attackPosition;
} else {
	_attackPos = _attackPosition;
};


_group = [
	_spawnPos,
	_side,
	_toSpawn,
	_relPositions,
	[],
	_skillRange,
	_ammoRange,
	_randomControls,
	_azimuth,
	_precisePos] call BIS_fnc_spawnGroup;
[_group, _attackPos, _searchRadius, true] call CBA_fnc_taskAttack;

_group deleteGroupWhenEmpty true;

_group;