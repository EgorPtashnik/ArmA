/**
	Plays radio sound with subtitles (default BIS subtitles)

	_title		=== STRING, name of speaker
	_subtitles 	=== STRING, subtitles / speach
    _chatType   === NUMBER [DEFAULT 0], chat type map value: 0 = sideChat, 1 = groupChat, 2 = globalChat
                === OR you can put #00bfff string for color to use custom color
	_sound		=== STRING [DEFAULT "in1"], sound for radio entering: "beep", "in1", "in2", "in3", "in4", "noise1", "noise2", "noise3"	
    _toUpper    === BOOLEAN [DEFAULT false], name of speaker is shown in upper case
	_withNoise	=== BOOLEAN [DEFAULT false], play noise sounds after radio entering sound
	_soundOut	=== STRING [DEFAULT _sound] - sound to play after noise 
	
	RETURN: NOTHING
 */

params [
	"_title",
	"_subtitles",
    ["_chatType", 0],
	["_sound", "in1"],
    ["_toUpper", false],
	["_withNoise", false],
	["_soundOut", "REPEAT"]
];

private _colorMap = ["#40d2fb", "#b5f961", "#ffffff"];
private _color = "";
private _message = "<t align='center' shadow='2' color='%1' size='1.7' font='RobotoCondensedBold'>%2: </t> <t color='#ffffff' size='1.7' font='RobotoCondensed'>%3</t>";

if (typeName _chatType == "STRING") then {
    _color = _chatType;
} else {
    _color = _colorMap select _chatType;
};

if (_toUpper) then {
    _title = toUpper _title;
};

_message = formatText [_message, _color, _title, _subtitles];

cutText [str _message, "PLAIN DOWN", 0.5, true, true];
playSound _sound;

if (_withNoise) then {
	if (_soundOut == "REPEAT") then {
		_soundOut = _sound;
	};
	sleep 1;
	playSound selectRandom ["noise1", "noise2", "noise3"];
	sleep 5;
	playSound _soundOut;
};
