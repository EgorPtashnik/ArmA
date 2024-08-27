// SET TASK
_task = [
	player, // OWNER
	"task_id", // ID; Can be [task_id, parent_id]
	["description","title"], // DESCRIPTION AND TITLE
	objNull, // DESTINATION
	"ASSIGNED", // STATE: CREATED, ASSIGNED, AUTOASSIGNED ("ASSIGNED" when no task is assigned yet, otherwise "CREATED"), SUCCEEDED, FAILED, CANCELED
	-1, //PRIORITY When the current task is completed, the system selects the one with the largest priority >= 0. To avoid auto assignment of that task, give it a priority of -1.
	true, // SHOW NOTIFICATIOn
	"attack" // task icons (see pictures/task_icons)
] call BIS_fnc_taskCreate;

//HANDLE TASK (CONDITION TO COMPLETE)
waitUntil {
	sleep 1;
	//CONDITION
};
[_task /* or task_id STRING */, "SUCCEEDED"] call BIS_fnc_taskSetState;

