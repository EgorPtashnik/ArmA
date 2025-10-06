// [5, "BLACK", 0] call EP_fnc_fadeIn;

params [
	["_duration", 5],
	["_color", "BLACK"],
	["_blur", 0]
];
0 fadeSound 0;
enableRadio false;
enableSentences false;
cutText ["", "BLACK", 0.001];
sleep 5;
0 fadeSound 1;
enableRadio true;
enableSentences true;
[1, _color, _duration, _blur] spawn BIS_fnc_fadeEffect;

_duration;
