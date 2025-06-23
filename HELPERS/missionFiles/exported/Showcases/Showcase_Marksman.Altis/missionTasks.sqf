case "BIS_tskVilla": {
	if (_taskState == "") then {

		[_taskID,"attack"] call bis_fnc_taskSetType;


		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Marksman_BIS_tskVilla_description","</marker>", "<marker name = 'BIS_mrkVillaArea'>"],
				localize "STR_A3_Showcase_Marksman_BIS_tskVilla_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskIntel": {
	if (_taskState == "") then {

		[_taskID,"search"] call bis_fnc_taskSetType;

		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Marksman_BIS_tskIntel_description",
				localize "STR_A3_Showcase_Marksman_BIS_tskIntel_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskLZ": {
	if (_taskState == "") then {

		[_taskID,"move"] call bis_fnc_taskSetType;

		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Marksman_BIS_tskLZ_description" ,"</marker>", "<marker name = 'BIS_mrkLZ01_area'>"],
				localize "STR_A3_Showcase_Marksman_BIS_tskLZ_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskGetIn": {
	if (_taskState == "") then {

		[_taskID,"wait"] call bis_fnc_taskSetType;

		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Marksman_BIS_tskGetIn_description",
				localize "STR_A3_Showcase_Marksman_BIS_tskGetIn_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskStartAttack": {
	if (_taskState == "") then {

		[_taskID,"radio"] call bis_fnc_taskSetType;

		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Marksman_BIS_tskStartAttack_description", "</marker>", "<marker name = 'BIS_mrkOverlook'>", "<marker name = 'BIS_mrkCampArea'>", "<marker name = 'BIS_mrkAttack'>"],
				localize "STR_A3_Showcase_Marksman_BIS_tskStartAttack_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskCamp": {
	if (_taskState == "") then {

		[_taskID,"attack"] call bis_fnc_taskSetType;

		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Marksman_BIS_tskCamp_description", "</marker>", "<marker name = 'BIS_mrkCampArea'>", "<marker name = 'BIS_mrkAttack'>"],
				localize "STR_A3_Showcase_Marksman_BIS_tskCamp_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};
