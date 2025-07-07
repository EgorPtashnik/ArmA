/**
	fn_handleTasks = compile preprocessFileLineNumbers "scripts\fn_handleTasks2.sqf";

	_task - task id
	
	["intro"] spawn fn_handleTasks;
 
	all managing is written inside case statement
	Meanin it should work like handleComms function - depending on parameters different execution should happen
 */
params [
	"_task",
	["_taskState", "SUCCEEDED"]
];
switch(_task) do {
	case "intro": {
		[ player, "task_building", 
		["Eliminate all enemy combatants in the designated area. Intelligence reports infantry squads.", "Clear Enemy Forces"],
		getMarkerPos "task_building", true, -1, true, "attack" ] call BIS_fnc_taskCreate;
	};
};
