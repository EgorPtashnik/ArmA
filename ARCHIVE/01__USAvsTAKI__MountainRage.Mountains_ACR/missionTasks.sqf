case "EP_prepare": {
    if (_taskState == "") then{

		[_taskID, "move"] call bis_fnc_taskSetType;

        [
			player,
			_taskID,
			[
				"Dismount at the designated position north of the enemy outpost.",
				"Insertion" // Or "Insertion" depending on preference
			],
			getMarkerPos "wpConvoy_3",
			true
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "EP_assault": {
    if (_taskState == "") then{

		[_taskID, "attack"] call bis_fnc_taskSetType;

        [
			player,
			_taskID,
			[
				"Assault the enemy <marker name='wpConvoy_6'>base</marker> alongside Alpha squad and neutralize all defending forces.",
				"Assault"
			],
			getMarkerPos "wpConvoy_6",
			"CREATED"
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "EP_destroySupportVehicle": {
    if (_taskState == "") then{

		[_taskID, "destroy"] call bis_fnc_taskSetType;

        [
			player,
			_taskID,
			[
				"Neutralize the enemy's support assets.", // "Техника поддержки" translates better as support assets or vehicles
				"Destroy Support Assets"
			],
			getMarkerPos "wpConvoy_6",
			true
		] call BIS_fnc_taskCreate;

        "EP_destroyShilka" call BIS_fnc_missionTasks;
        "EP_destroyGrad_1" call BIS_fnc_missionTasks;
        "EP_destroyGrad_2" call BIS_fnc_missionTasks;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "EP_destroyShilka": {
    if (_taskState == "") then{

		[_taskID, "destroy"] call bis_fnc_taskSetType;

        [
			player,
			[_taskID, "EP_destroySupportVehicle"],
			[
				"",
				"AA: 'Shilka'"
			],
			getPos EP_Shilka,
			"CREATED",
            -1,
            false
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "EP_destroyGrad_1": {
    if (_taskState == "") then{

		[_taskID, "destroy"] call bis_fnc_taskSetType;

        [
			player,
			[_taskID, "EP_destroySupportVehicle"],
			[
				"",
				"Artillery: 'BM-21 Grad'" // Expanded BM to BM-21 for standard military naming
			],
			getPos EP_Grad_1,
			"CREATED",
            -1,
            false
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};

case "EP_destroyGrad_2": {
    if (_taskState == "") then{

		[_taskID, "destroy"] call bis_fnc_taskSetType;

        [
			player,
			[_taskID, "EP_destroySupportVehicle"],
			[
				"",
				"Artillery: 'BM-21 Grad'"
			],
			getPos EP_Grad_2,
			"CREATED",
            -1,
            false
		] call BIS_fnc_taskCreate;
    } else {
        [_taskID, _this] call BIS_fnc_taskSetState;
    }
};
