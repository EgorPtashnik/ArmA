/**
	fn_handleTasks = compile preprocessFileLineNumbers "scripts\fn_handleTasks.sqf";

	_task - task id
	_taskState - task state to be set
	
	(if task does not exists - creates in in switch block)

	["taskFirst"] spawn fn_handleTasks;
	["taskFirst", "FAILED"] spawn fn_handleTasks;
 */
params [
	"_task",
	["_taskState", "SUCCEEDED"]
];

if ( [_task] call BIS_fnc_taskExists ) then {
	[_task, _taskState] call BIS_fnc_taskSetState;
} else {
	switch(_task) do {
		case "task_building": {
			[ player, "task_building", 
			["Eliminate all enemy combatants in the designated area. Intelligence reports infantry squads.", "Clear Enemy Forces"],
			getMarkerPos "task_building", true, -1, true, "attack" ] call BIS_fnc_taskCreate;
		};

		case "task_car": {

		};

		case "task_civ": {

		};

		case "task_defend": {

		};
	};
};
