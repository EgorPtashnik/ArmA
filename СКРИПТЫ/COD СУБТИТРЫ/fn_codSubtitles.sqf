/**
/**
	fn_codSubtitles = compile preprocessFileLineNumbers "scripts\fn_codSubtitles.sqf";

	_comm - block to be played

	["TITLE", "SUBTITLE", 1, 1] spawn fn_codSubtitles;
 */


 */

params [
	"_title",
	"_subtitles",
	["_duration", 0.5],
	["_color", 2],
    ["_toUpper", false]
];

private _colorMap = ["#40d2fb", "#b5f961", "#ffffff"];
private _color = "";
private _message = "<t align='center' shadow='2' color='%1' size='1.7' font='RobotoCondensedBold'>%2: </t> <t color='#ffffff' size='1.7' font='RobotoCondensed'>%3</t>";

if (typeName _color != "STRING") then {
    _color = _colorMap select _chatType;
};

if (_toUpper) then {
    _title = toUpper _title;
};

_message = formatText [_message, _color, _title, _subtitles];

cutText [str _message, "PLAIN DOWN", _duration, true, true];
