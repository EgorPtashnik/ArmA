
["task_destroy", "FAILED"] call BIS_fnc_taskSetState;
sleep 2;
private _handle = ["fail_1"] call fnc_comms;

waitUntil {
	sleep 1;
	scriptDone _handle;
};

["fail1", false] call BIS_fnc_endMission;