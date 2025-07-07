// IMPORT
// fn_handleTasks = compile preprocessFileLineNumbers "scripts\fn_handleTasks.sqf";
// CALL
//  ["task", "ASSIGNED"] spawn fn_handleTasks

params [
	"_task",
	["_taskState", "SUCCEEDED"]
];

if ( [_task] call BIS_fnc_taskExists ) then {
	[_task, _taskState] call BIS_fnc_taskSetState;
} else {
	switch(_task) do {
		case "taskid": {
			[ player, "taskid", 
			["TASK DESCRIPTION", "TASK TITLE"],
			objNull, true, -1, true, "attack" ] call BIS_fnc_taskCreate;
		};
	};
};
