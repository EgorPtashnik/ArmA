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
		case "taskMain": {
			[ player, "taskMain", 
			["Найдите и уничтожьте три заправщика в районе.<br/>Используйте элемент неожиданности и не дайте заправщикам скрыться!", "Уничтожить заправщики"],
			objNull, true, -1, true, "destroy" ] call BIS_fnc_taskCreate;
		};
	};
};
