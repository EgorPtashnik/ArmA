// IMPORT
// pf_tasks = compile preprocessFileLineNumbers "fnc\YP_handleTasks.sqf";
// CALL
//  ["task", "ASSIGNED"] spawn pf_tasks

params [
	"_task",
	["_taskState", "SUCCEEDED"]
];

if ( [_task] call BIS_fnc_taskExists ) then {
	[_task, _taskState] call BIS_fnc_taskSetState;
} else {
	switch(_task) do {
		case "task1": {
			[ player, "task1", 
			["Description", "Title"],
			position player, true, -1, true, "search" ] call BIS_fnc_taskCreate;
		};
	};
};
