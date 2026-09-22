case "Stealth": {
    if (_taskState == "") then{

		[_taskID, "unknown"] call BIS_fnc_taskSetType;
        private _text = format [
            "%1<br/>%2<br/>%3",
            "Группе необходимо соблюдать режим полной маскировки.",
            "Избегайте визуального контакта с часовыми и не вступайте в огневой бой без необходимости.",
            "В случае обнаружения бандиты могут ликвидировать пленного или укрепить оборону комплекса, что сделает спасательную операцию невозможной." 
        ];

        [
            EP_Player, _taskID, [_text, "Соблюдать скрытность"],
            objNull,
            "CREATED"
        ] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    };
};

case "Camp01": {
    if (_taskState == "") then{

		[_taskID, "search"] call BIS_fnc_taskSetType;
        private _text = "Нейтрализуйте силы противника в точке <marker name='mrk_Camp01'>Альфа</marker> и проведите тщательный обыск территории лагеря на предмет документов, цифровых носителей или иных разведданных, указывающих на местонахождение заложника.";

        [
			EP_Player, _taskID, [_text, "Исследуйте лагерь"],
			objNull,
			true
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "Camp02": {
    if (_taskState == "") then{

		[_taskID, "search"] call BIS_fnc_taskSetType;
        private _text = format [
            "%1<br/>%2",
            "В первом лагере информации не найдено. Продвигайтесь далее к следующей позиции бандитов.",
            "Нейтрализуйте состав лагеря и ищите дальше."
        ];

        [
			EP_Player, _taskID, [_text, "Продолжайте поиски"],
			objNull,
			true
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "Camp04": {
    if (_taskState == "") then{

		[_taskID, "attack"] call BIS_fnc_taskSetType;
        private _text = format [
            "%1<br/>%2",
            "Локация заложника установлена. Дано разрешение на огонь на поражение.",
            "Немедленно выдвигайтесь и спасите объект."
        ];

        [
			EP_Player, _taskID, [_text, "Спасите Package"],
			markerPos "mrk_Camp04",
			true
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "Extraction": {
    if (_taskState == "") then{

		[_taskID, "Run"] call BIS_fnc_taskSetType;
        private _text = format [
            "%1<br/><br/>%2",
            "Выдвигайтесь к точке эвакуации и покиньте зону операции вместе с группой Raven.",
            "Package должен остаться в живых."
        ];

        [
			EP_Player, _taskID, [_text, "Эвакуируйтесь"],
			markerPos "mrk_Extraction",
			true
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};