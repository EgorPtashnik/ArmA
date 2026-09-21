case "BIS_tskDorida":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M02_taskDoridaDesc", "</marker>", "<marker name = 'BIS_mrkInfantryS'>", "<marker name = 'BIS_mrkWiesel'>", "<marker name = 'BIS_mrkMBT'>", "<marker name = 'BIS_mrkMortar'>", "<marker name = 'BIS_mrkDorida'>"],
				localize "STR_A3_Tanks_M02_taskDoridaTitle",
				""
			],
			(getMarkerPos "BIS_mrkDorida"),
			true,
			nil,
			nil,
			"attack"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskFOBFind":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M02_taskFOBFindDesc","</marker>", "<marker name = 'BIS_mrkFOBArea'>"],
				localize "STR_A3_Tanks_M02_taskFOBFindTitle",
				""
			],
			(getMarkerPos "BIS_mrkFOBArea"),
			true,
			nil,
			nil,
			"search"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskFOBDestroy":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M02_taskFOBDestroyDesc","</marker>", "<marker name = 'BIS_mrkInfantryN'>"],
				localize "STR_A3_Tanks_M02_taskFOBDestroyTitle",
				""
			],
			(getMarkerPos "BIS_mrkFOB"),
			true,
			nil,
			nil,
			"attack"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskCollateralDamage":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				localize "STR_A3_Tanks_M01_taskCollateralDamageDesc",
				localize "STR_A3_Tanks_M01_taskCollateralDamageTitle",
				""
			],
			nil,
			false,
			nil,
			false,
			"danger"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskMaintenance":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M02_taskMaintenanceDesc","</marker>", "<marker name = 'BIS_mrkMaintenance'>"],
				localize "STR_A3_Tanks_M02_taskMaintenanceTitle",
				""
			],
			(getMarkerPos "BIS_mrkMaintenance"),
			true,
			nil,
			nil,
			"repair"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};
