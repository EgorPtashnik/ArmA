case "BIS_locate": {
	if (!(_taskExists)) then {

		[_taskID,"search"] call bis_fnc_taskSetType;

		[
			BIS_playerGroup,
			_taskID,
			[
				[
					"STR_A3_Showcase_FiringFromVehicles_BIS_locate_desc",
					"<marker name = 'BIS_crashSite'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_FiringFromVehicles_BIS_locate_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Crash site located
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_ROE": {
	if (!(_taskExists)) then {

		[_taskID,"move"] call bis_fnc_taskSetType;

		[
			BIS_playerGroup,
			_taskID,
			[
				"STR_A3_Showcase_FiringFromVehicles_BIS_ROE_desc",
				"STR_A3_Showcase_FiringFromVehicles_BIS_ROE_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Players adhered to the ROE
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};

				case "FAILED": {
					// Players failed to follow the ROE
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_destroy": {
	if (!(_taskExists)) then {

		[_taskID,"destroy"] call bis_fnc_taskSetType;

		[
			BIS_playerGroup,
			_taskID,
			[
				"STR_A3_Showcase_FiringFromVehicles_BIS_destroy_desc",
				"STR_A3_Showcase_FiringFromVehicles_BIS_destroy_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "FAILED": {
					// UAV ran out of ammo
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};

				case "SUCCEEDED": {
					// Wreckage destroyed
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_loc1": {
	if (!(_taskExists)) then {

		[_taskID,"search"] call bis_fnc_taskSetType;

		[
			BIS_playerGroup,
			_taskID,
			[
				[
					"STR_A3_Showcase_FiringFromVehicles_BIS_loc1_desc",
					"<marker name = 'BIS_loc1'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_Showcase_FiringFromVehicles_BIS_loc1_title",
				"STR_A3_Showcase_FiringFromVehicles_BIS_loc1_marker"
			],
			markerPos _taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Searched the gas station
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};

				case "CANCELED": {
					// The captives were at the outpost
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_loc2": {
	if (!(_taskExists)) then {

		[_taskID,"search"] call bis_fnc_taskSetType;

		[
			BIS_playerGroup,
			_taskID,
			[
				[
					"STR_A3_Showcase_FiringFromVehicles_BIS_loc2_desc",
					"<marker name = 'BIS_loc2'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_Showcase_FiringFromVehicles_BIS_loc2_title",
				"STR_A3_Showcase_FiringFromVehicles_BIS_loc2_marker"
			],
			markerPos _taskID
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				};

				case "SUCCEEDED": {
					// Searched the outpost
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};

				case "CANCELED": {
					// The captives were at the gas station
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_extract": {
	if (!(_taskExists)) then {

		[_taskID,"exit"] call bis_fnc_taskSetType;


		[
			BIS_playerGroup,
			_taskID,
			[
				"STR_A3_Showcase_FiringFromVehicles_BIS_extract_desc",
				"STR_A3_Showcase_FiringFromVehicles_BIS_extract_title",
				"STR_A3_Showcase_FiringFromVehicles_BIS_extract_marker"
			],
			if (BIS_crewLocation == 1) then {markerPos "BIS_gasLZ"} else {markerPos "BIS_outpostLZ"},
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Successfully extracted
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					[_taskID, position BIS_extract] call BIS_fnc_taskSetDestination;
				};
			};
		};
	};
};