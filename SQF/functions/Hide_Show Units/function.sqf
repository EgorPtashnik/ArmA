/**
	fn_hide = compile preprocessFileLineNumbers "scripts\fn_hide.sqf";

	_group - group to hide
	_hide - true to hide, false to reveal

	[groupWave_1, true] call fn_hide;
	[groupWave_1, false] call fn_hide;

 */

params [
	"_group",
	["_toHide", true]
];

{
	private _vehicle = vehicle _x;
	_vehicle enableSimulation !_toHide;
	_vehicle hideObject _toHide;
	_vehicle setCaptive _toHide;
	_vehicle allowDamage !_toHide;
} forEach units _group;