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
	_x enableSimulation !_toHide;
	_x hideObject _toHide;
	_x setCaptive _toHide;
	_x allowDamage !_toHide;
} forEach units _group;