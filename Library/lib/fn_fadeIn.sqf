// [5, "BLACK", 0] spawn EP_fnc_fadeIn;

params [
	["_duration", 5],
	["_color", "BLACK"],
	["_blur", 0]
];

0 fadeSound 0;
[1, _color, _duration, _blur] spawn BIS_fnc_fadeEffect;
sleep 3;
_duration fadeSound 1;