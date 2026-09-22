case "taskInsertion": {
    [_taskID, "meet"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Meet your team at <marker name='EP_mrkStart'>LZ</marker>.", "Meet Ten-3 at LZ"],
        getMarkerPos "EP_mrkStart",
        true
    ] call BIS_fnc_taskCreate;
};

case "taskAPC": {
    [_taskID, "target"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Setup an IED trap and blow up enemy's APC to reduce the risk of operation.", "APC Patrol (Optional)"],
        objNull,
        "CREATED"
    ] call BIS_fnc_taskCreate;
};

case "taskArty": {
    [_taskID, "destroy"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Destroy enemy's artillery vehicles within the <marker name='EP_mrkBase'>AO</marker>.", "Artillery Assets"],
        objNull,
        true
    ] call BIS_fnc_taskCreate;
};

case "taskExtraction": {
    [_taskID, "exit"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Move to <marker name='EP_mrkExtr'>the extraction point</marker> and wait for the helicopter.", "Extraction"],
        objNull,
        true
    ] call BIS_fnc_taskCreate;
};

case "taskCity": {
    [_taskID, "attack"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Support our forces in <marker name='EP_mrkCity'>the city</marker> in any way possible to draw the enemy back.", "Combat Support"],
        objNull,
        true
    ] call BIS_fnc_taskCreate;
};