params [
	"_task",
	["_taskState", "SUCCEEDED"]
];

if ( [_task] call BIS_fnc_taskExists ) then {
	[_task, _taskState] call BIS_fnc_taskSetState;
} else {
	switch(_task) do {
		case "taskStealCar": {
			[ player, "taskStealCar", 
			[
				"Найдите и украдите машину противника, чтобы добраться до союзных сил.",
				"Украдите машину"
			], objNull, true, -1, true, "search" ] call BIS_fnc_taskCreate;
		};

		case "taskRetreat": {
			[ player, "taskRetreat", 
			[
				"Вернитесь к позициям сил США",
				"Отступление"
			], getMarkerPos "usaPosition", true, -1, true, "run" ] call BIS_fnc_taskCreate;
		};

		case "saveEcho": {
			[ player, "saveEcho", 
			[
				"Доберитесь до отряда Эхо и эвакуируйте вместе с собой",
				"Помочь Эхо"
			], getPos leader grpEcho, true, -1, true, "takeoff" ] call BIS_fnc_taskCreate;
		};
	};
};
