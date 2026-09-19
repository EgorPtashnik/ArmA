case "BIS_seize" : {
	if !([_taskId] call BIS_fnc_taskExists) then {

		[_taskID,"attack"] call bis_fnc_taskSetType;

		[
			WEST,
			_taskID,
			[
				localize "STR_A3_Showcase_Combined_Arms_BIS_seize_desc",
				localize "STR_A3_Showcase_Combined_Arms_BIS_seize_title",
				localize "STR_A3_Showcase_Combined_Arms_BIS_seize_marker"
			],
			getMarkerPos "BIS_enemy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_reinforcements" : {
	if !([_taskId] call BIS_fnc_taskExists) then {

		[_taskID,"defend"] call bis_fnc_taskSetType;

		[
			WEST,
			_taskID,
			[
				localize "STR_A3_Showcase_Combined_Arms_BIS_reinforcements_desc",
				localize "STR_A3_Showcase_Combined_Arms_BIS_reinforcements_title",
				localize "STR_A3_Showcase_Combined_Arms_BIS_reinforcements_marker"
			],
			getMarkerPos "BIS_enemyText",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_extraction" : {
	if !([_taskId] call BIS_fnc_taskExists) then {

		[_taskID,"defend"] call bis_fnc_taskSetType;

		[
			WEST,
			_taskID,
			[
				localize "STR_A3_Showcase_Combined_Arms_BIS_extraction_desc",
				localize "STR_A3_Showcase_Combined_Arms_BIS_extraction_title",
				localize "STR_A3_Showcase_Combined_Arms_BIS_extraction_marker"
			],
			getMarkerPos "BIS_extraction",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_retreat" : {
	if !([_taskId] call BIS_fnc_taskExists) then {

		[_taskID,"run"] call bis_fnc_taskSetType;

		[
			WEST,
			_taskID,
			[
				localize "STR_A3_Showcase_Combined_Arms_BIS_retreat_desc",
				localize "STR_A3_Showcase_Combined_Arms_BIS_retreat_title",
				localize "STR_A3_Showcase_Combined_Arms_BIS_retreat_marker"
			],
			getMarkerPos "BIS_militaryRange",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
