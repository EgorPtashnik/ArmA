params ["_spawnPosArray", "_target"];

private ["_spawnClasses"];
_spawnClasses = ["CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Soldier_AR", "CUP_O_TK_INS_Soldier", "CUP_O_TK_INS_Soldier_FNFAL"];
{
	sleep (selectRandom [10, 30, 60]);
	_grp = [_x, independent, _spawnClasses] call BIS_fnc_spawnGroup;
	[_grp, _target] call BIS_fnc_taskAttack;
} forEach _spawnPosArray;