case "p1_1": {
	if !([_taskID] call BIS_fnc_taskExists) then {
		[_taskID, "kill"] call EP_fnc_missionTasks;
		private _pos = markerPos "O_MrkCompound_1";
		_pos set [2, 20];
		[
			player,
			_taskID,
			["Neutralize all foot mobiles in the area and search for any intel.", "Clear Compound"],
			_pos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, true] call EP_fnc_missionTasks;
	};
};

case "p1_2": {
	if !([_taskID] call BIS_fnc_taskExists) then {
		[_taskID, "kill"] call EP_fnc_missionTasks;
		private _pos = markerPos "O_MrkCompound_2";
		_pos set [2, 20];
		[
			player,
			_taskID,
			["Another <marker name='O_MrkCompound_2'>camp</marker> was spotted nearby. <br/>Scout and secure the area.", "Clear Compound"],
			_pos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, true] call EP_fnc_missionTasks;
	};
};
