/*	
	"CREATED"
	"ASSIGNED"
	"SUCCEEDED"
	"FAILED"
	"CANCELED"
*/

case "AA_POST": {
	if !(_taskID call BIS_fnc_taskExists) then {
		[_taskID, "attack"] call BIS_fnc_taskSetType;
		[
			EP_Player,
			_taskID,
			[
				"Нейтрализуйте личный состав <marker name='m_AA_Post'>аванпоста</marker> противника.",
				"Пост: ПВО"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "WAIT_REINFORCEMENTS": {
	if !(_taskID call BIS_fnc_taskExists) then {
		[_taskID, "wait"] call BIS_fnc_taskSetType;
		[
			EP_Player,
			_taskID,
			[
				"Вертолеты в пути. Ждите подкрепление и удерживайте позицию.",
				"Подкрепление"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "ATTACK_VILLAGE": {
	if !(_taskID call BIS_fnc_taskExists) then {
		[_taskID, "attack"] call BIS_fnc_taskSetType;
		[
			EP_Player,
			_taskID,
			[
				"Момент настал! Атакуйте северную часть острова вместе с группой Меч и выбейте противника из <marker name='MARKER_VILLAGE'>деревни</marker>.",
				"В Атаку"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
	};
};

case "DESTROY_SUPPLY_TRUCKS": {
	if !(_taskID call BIS_fnc_taskExists) then {
		[_taskID, "destroy"] call BIS_fnc_taskSetType;
		[
			EP_Player,
			_taskID,
			[
				"Нападите на <marker name='MARKER_SUPPLY_BASE'>базу</marker> противника и взорвите грузовики с припасами. Не дайте грузовикам уйти!",
				"Уничтожить машины снабжения"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};