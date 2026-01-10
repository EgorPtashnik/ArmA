/*	
	"CREATED"
	"ASSIGNED"
	"SUCCEEDED"
	"FAILED"
	"CANCELED"
*/

case "GET_TO_POSITION": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "default"] call BIS_fnc_taskSetType;
		[
			player,
			_taskID,
			[
				"Take <marker name='EP_MARKER_SNIPER_POSITION'>the position on the cliff</marker> to help Scout and check AO.",
				"Take Position"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};	
};

case "SUPPORT_SCOUT": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "scout"] call BIS_fnc_taskSetType;
		[
			player,
			_taskID,
			[
				"Listen carefully to Scout's requests and support the insertion.",
				"Support Scout"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "KILL_STATIC_PATROL": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "target"] call BIS_fnc_taskSetType;
		[
			player,
			[_taskID, "SUPPORT_SCOUT"],
			[
				"",
				"Eliminate Patrol"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "KILL_DYNAMIC_PATROL": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "target"] call BIS_fnc_taskSetType;
		[
			player,
			[_taskID, "SUPPORT_SCOUT"],
			[
				"",
				"Eliminate Patrol"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "BASE": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "Attack"] call BIS_fnc_taskSetType;
		[
			player,
			_taskID,
			[
				"Check <marker name='EP_MARKER_BASE'>the base</marker> for any potential danger to Scout unit and support the assault.",
				"Supply Base"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "BASE_APC": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "destroy"] call BIS_fnc_taskSetType;
		[
			player,
			[_taskID, "BASE"],
			[
				"",
				"Destroy APC"
			],
			EP_BASE_APC,
			"AUTOASSIGNED"
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "BASE_OFFICER": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "kill"] call BIS_fnc_taskSetType;
		[
			player,
			[_taskID, "BASE"],
			[
				"",
				"Kill High Rank Officer"
			],
			EP_BASE_OFFICER,
			"AUTOASSIGNED"
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "BASE_PATROL": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "kill"] call BIS_fnc_taskSetType;
		[
			player,
			[_taskID, "BASE"],
			[
				"",
				"Eliminate Patrol"
			],
			leader EP_GROUP_BASE_PATROL,
			"AUTOASSIGNED"
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "BASE_STATIC": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "danger"] call BIS_fnc_taskSetType;
		[
			player,
			[_taskID, "BASE"],
			[
				"",
				"Disarm Static Defence"
			],
			EP_BASE_STATICDEF,
			"AUTOASSIGNED"
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};
