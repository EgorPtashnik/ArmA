case "Start_1": {
	if !([_taskID] call BIS_fnc_taskExists) then {
		[_taskID, "scout"] call EP_fnc_missionTasks;
		[
			player,
			_taskID,
			["Reach <marker name='I_MrkOverwatch_1'>position</marker> nearby <marker name='O_MrkCompound_1'>found compound</marker> and scout the area.", "Get to Overview Position"],
			objNull,
			true
		] call BIS_fnc_taskCreate;
	} else {
		sleep 2;
		if (scriptDone Trg_OverviewPos_1_Reached) then {
			[_taskID, true] call EP_fnc_missionTasks;
		} else {
			[_taskID, "CANCELED"] call EP_fnc_missionTasks;
		}
	};
};
