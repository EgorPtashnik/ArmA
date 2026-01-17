/*	
	"CREATED"
	"ASSIGNED"
	"SUCCEEDED"
	"FAILED"
	"CANCELED"
*/

case "PATROL": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "scout"] call BIS_fnc_taskSetType;
		[
			EP_PLAYER,
			_taskID,
			[
				"Watch the area for suspicious activity and report in case of any.",
				"Stand Watch"
			],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
	};
};

case "GET_IN_HELI": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "getin"] call BIS_fnc_taskSetType;
		[
			EP_PLAYER,
			_taskID,
			[
				"You are joining rescue group. Get in the helicopter and meet your unit.",
				"Get In Little Bird"
			],
			EP_LITTLE_BIRD,
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};	
};

case "CRASH_SITE": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "destroy"] call BIS_fnc_taskSetType;
		[
			EP_PLAYER,
			_taskID,
			[
				"Investigate the crash site and destroy helicopter wreck before any EIF forces arrive.",
				"Crash Site"
			],
			(EP_CRASH_MAP get "WRECK"),
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};	
};

case "GET_CHARGES": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "box"] call BIS_fnc_taskSetType;
		[
			EP_PLAYER,
			[_taskID, "CRASH_SITE"],
			[
				"Get the explosives from the sapper body.",
				"Get Explosives"
			],
			(getPos EP_SAPPER),
			"CREATED"
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};	
};

case "DESTROY_WRECK": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "default"] call BIS_fnc_taskSetType;
		[
			EP_PLAYER,
			[_taskID, "CRASH_SITE"],
			[
				"Set up explosives and destroy the wreck.",
				"Destroy Helicopter Wreck"
			],
			objNull,
			"CREATED"
		] call BIS_fnc_taskCreate;
	} else {
		// Обработка для второго вызова
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};	
};
