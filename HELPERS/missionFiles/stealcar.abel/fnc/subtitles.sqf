params [
	"_title",
	"_subtitles",
    ["_chatType", 0],
    ["_toUpper", true]
];

private _colorMap = ["#40d2fb", "#b5f961", "#ffffff"];
private _color = "";
private _message = "<t align='center' shadow='2' color='%1' size='1.7' font='RobotoCondensedBold'>%2:<br/></t><t color='#ffffff' size='1.7' font='RobotoCondensed'>%3</t>";

_color = _colorMap select _chatType;

if (_toUpper) then {
    _title = toUpper _title;
};

_message = formatText [_message, _color, _title, _subtitles];

cutText [str _message, "PLAIN DOWN", 1, true, true];
playSound "in2";
sleep 7;
