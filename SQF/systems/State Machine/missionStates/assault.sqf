[SM, "assault", {
	["task_1"] spawn fn_handleTasks;
	sleep 2;
	savegame;
	sleep 5;
	["task_2"] spawn fn_handleTasks;
}, [
	// transitions
   	[ { ( { alive _x } count (units grpE_1 + units grpE_2 + units grpE_3) ) == 0 }, "end" ],
	[ { missionNamespace getVariable ["spotted", false]}, "assault_counter"]
]] call SM_fnc_addState;



[SM, "assault_counter", {
	{
		[_x] call CBA_fnc_clearWaypoints;
		[_x, getPos player, 100] call CBA_fnc_taskAttack;
	} forEach [grpE_1, grpE_2, grpE_3];
	playMusic "CUP_A1_S_Riff";
}, [
	// transitions
	[ { ( { alive _x } count (units grpE_1 + units grpE_2 + units grpE_3) ) == 0 }, "end" ]
]] call SM_fnc_addState;