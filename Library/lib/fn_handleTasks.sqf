params [
	"_taskId",
	["_newState", "SUCCEEDED"],
	["_showHint", true]
];

private _taskExists = [_taskId] call BIS_fnc_taskExists;

if (_taskExists) then {
	[_taskId, _newState, _showHint] call BIS_fnc_taskSetState;
} else {
	(EP_tasks get _taskId) call BIS_fnc_taskCreate;
};

_taskId
