// 	["TITLE", "SUBTITLES"] spawn EP_fnc_conversation ;

params [
	"_title",
	"_subtitles",
	["_duration", 0.5],
	["_isRadio", true],
	["_radioSoundIn", "myin1"],
	["_radioSoundOut", "myin4"],
	["_chatType", 2],
    ["_toUpper", true]
];

private _noises = ["mynoise1", "mynoise2", "mynoise3"];
private _colorMap = ["#40d2fb", "#b5f961", "#ffffff"];
private _message = "<br/><br/><br/><br/><br/><t align='center' shadow='2' color='%1' size='1.5' font='RobotoCondensedBold'>%2:</t><br/><t color='#ffffff' size='1.5' shadow='2' font='RobotoCondensedBold'>%3</t>";
private ["_color", "_soundId"];

if (typeName _chatType != "STRING") then {
    _color = _colorMap select _chatType;
} else {
	_color = _chatType;
};

if (_toUpper) then {
    _title = toUpper _title;
};

_message = formatText [_message, _color, _title, _subtitles];

cutText [str _message, "PLAIN DOWN", _duration, true, true];

if (_isRadio) then {
	playSoundUI [ _radioSoundIn ];
	private _time = time;
	while { time < ( _time + _duration * 10 ) } do {
		_soundId = playSoundUI [ ( selectRandom _noises ) ];
		sleep 5;
	};
	stopSound _soundId;
	playSoundUI [ _radioSoundOut ];
	sleep 2;
} else {
	playSoundUI [ "mybeep" ];
	sleep ( _duration * 10 );
};