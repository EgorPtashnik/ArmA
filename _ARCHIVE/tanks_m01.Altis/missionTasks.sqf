case "BIS_tskEquipment":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskToolkitDesc","</marker>", "<marker name = 'BIS_mrkArmory'>"],
				localize "STR_A3_Tanks_M01_taskToolkitTitle",
				""
			],
			[BIS_Box,true],
			true,
			nil,
			nil,
			"backpack"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskGetIn":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskWieselDesc","</marker>", "<marker name = 'BIS_mrkWiesel'>"],
				localize "STR_A3_Tanks_M01_taskWieselTitle",
				""
			],
			[BIS_Wiesel,true],
			false,
			nil,
			nil,
			"getin"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskCheckpointA":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskCheckpointDesc","</marker>", "<marker name = 'BIS_mrkCheckpointA'>"],
				localize "STR_A3_Tanks_M01_taskCheckpointTitle",
				""
			],
			[BIS_AROfficer,true],
			false,
			nil,
			nil,
			"talk"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskCheckpointB":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskBaseDesc","</marker>", "<marker name = 'BIS_mrkCheckpointB'>"],
				localize "STR_A3_Tanks_M01_taskBaseTitle",
				""
			],
			(getMarkerPos "BIS_mrkCheckpointB"),
			true,
			nil,
			false,
			"use"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskForest":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskForestDesc","</marker>", "<marker name = 'BIS_mrkForestArea'>"],
				localize "STR_A3_Tanks_M01_taskForestTitle",
				""
			],
			(getMarkerPos "BIS_mrkForestArea"),
			true,
			nil,
			nil,
			"search"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskRTB":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskRTBDesc","</marker>", "<marker name = 'BIS_mrkWiesel'>"],
				localize "STR_A3_Tanks_M01_taskRTBTitle",
				""
			],
			(getMarkerPos "BIS_mrkWiesel"),
			true,
			nil,
			nil,
			"exit"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskAttack":
{
	if (_taskState == "") then
	{
		[
			BIS_ARPlayer,
			_taskID,
			[
				format [localize "STR_A3_Tanks_M01_taskVillageDesc","</marker>", "<marker name = 'BIS_mrkVillage'>"],
				localize "STR_A3_Tanks_M01_taskVillageTitle",
				""
			],
			(getMarkerPos "BIS_mrkVillage"),
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
			nil,
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
				format [localize "STR_A3_Tanks_M01_taskMaintenanceDesc","</marker>", "<marker name = 'BIS_mrkMaintenance'>"],
				localize "STR_A3_Tanks_M01_taskMaintenanceTitle",
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
