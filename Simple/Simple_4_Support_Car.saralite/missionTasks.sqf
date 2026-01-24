/*	
	"CREATED"
	"ASSIGNED"
	"SUCCEEDED"
	"FAILED"
	"CANCELED"
*/

case "blashka": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "defend"] call BIS_fnc_taskSetType;
		[
			oPlayer,
			_taskID,
			[
				"Destroy all enemy APCs before they breach our <marker name='mrkBlashka'>defence line</marker>.",
				"Help 'Beshka'"
			],
			[2285.12,5767.25,0],
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

case "blashka_1": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "destroy"] call BIS_fnc_taskSetType;
		[_taskID, true] call BIS_fnc_taskSetAlwaysVisible;
		[
			oPlayer,
			[_taskID, "blashka"],
			[
				"",
				"Warrior"
			],
			oEastAPC_1,
			"CREATED", -1, false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	};
};

case "blashka_2": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "destroy"] call BIS_fnc_taskSetType;
		[_taskID, true] call BIS_fnc_taskSetAlwaysVisible;
		[
			oPlayer,
			[_taskID, "blashka"],
			[
				"",
				"Warrior"
			],
			oEastAPC_2,
			"CREATED", -1, false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	};

};

case "blashka_3": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[_taskID, "destroy"] call BIS_fnc_taskSetType;
		[_taskID, true] call BIS_fnc_taskSetAlwaysVisible;
		[
			oPlayer,
			[_taskID, "blashka"],
			[
				"",
				"Warrior"
			],
			oEastAPC_3,
			"CREATED", -1, false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	};

};