case "BIS_tskDefense":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M03_taskDefenseDesc","</marker>", "<marker name = 'BIS_mrkLine01'>", "<marker name = 'BIS_mrkLine02'>", "<marker name = 'BIS_mrkPanagia'>"],
				localize "STR_A3_Tanks_M03_taskDefenseTitle",
				""
			],
			nil,
			true,
			nil,
			nil,
			"defend"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskInvestigateTank":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				localize "STR_A3_Tanks_M03_taskInvestigateTankDesc",
				localize "STR_A3_Tanks_M03_taskInvestigateTankTitle",
				""
			],
			[BIS_Tank,true],
			true,
			nil,
			nil,
			"search"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskDestroyTank":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				localize "STR_A3_Tanks_M03_taskDestroyTankDesc",
				localize "STR_A3_Tanks_M03_taskDestroyTankTitle",
				""
			],
			[BIS_Tank,true],
			true,
			nil,
			nil,
			"destroy"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskPanagia":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M03_taskPanagiaTitle","</marker>", "<marker name = 'BIS_mrkPanagia'>"],
				localize "STR_A3_Tanks_M03_taskPanagiaTitle",
				""
			],
			getMarkerPos "BIS_mrkPanagia",
			true,
			nil,
			nil,
			"attack"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskDestroyArmata":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				localize "STR_A3_Tanks_M03_taskDestroyArmataDesc",
				localize "STR_A3_Tanks_M03_taskDestroyArmataTitle",
				""
			],
			[BIS_Armata,true],
			true,
			nil,
			nil,
			"destroy"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};
