// [5, "BLACK", 0] spawn EP_fnc_fadeOut;

params [
	["_duration", 5],
	["_color", "BLACK"],
	["_blur", 0]
];

[0, _color, _duration, _blur] spawn BIS_fnc_fadeEffect;
_duration fadeSound 0;