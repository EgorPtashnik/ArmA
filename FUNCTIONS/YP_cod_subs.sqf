/**
ИМПОРТ:
pf_subs = compile preprocessFileLineNumbers "function\dialog\YP_cod_subs.sqf";


	Играет выбранный звук с субтитрами в стиле Call Of Duty

	_title		STRING						Имя спикера

	_subtitles 	STRING						Текст субтитров

    _chatType   NUMBER [DEFAULT 0]			Цвет субтитров

											0 =  #40d2fb,
											1 =  #b5f961,
											2 =  #ffffff
                							ИЛИ
											Можно передать кастомный цвет строкой #4ecd3d

	_sound		STRING [DEFAULT "in1"]		Звук для воспроизведения. Один из
											"beep", "in1", "in2", "in3", "in4", "in5", "in6", "noise1", "noise2", "noise3", "noise4"

    _toUpper    BOOLEAN [DEFAULT false]		Показать имя спикера капсом

	_withNoise	BOOLEAN [DEFAULT false]		Запустить помехи на 5 секунд

	_soundOut	STRING [DEFAULT "REPEAT"]	Воспроизвести звук в конце радиопередачи (работает, если _withNoise === true)
											Можно передать имя звука
	
	RETURN: NOTHING

	[ 	"Имя",
		"Сообщение",
		0,
		"in1",
		false,
		true,
		"in4"	] spawn YP_fnc_showSubtitlesCOD;

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
