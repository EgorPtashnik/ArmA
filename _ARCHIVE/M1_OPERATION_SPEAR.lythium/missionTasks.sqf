case "taskOutpost": {
    [
        player,
        _taskID,
        ["Clear the enemy <marker name='m_outpost'>outpost</marker> to prolong alarm raise.", "Clear Outpost"],
        objNull,
        true
    ] call bis_fnc_taskCreate;

    [_taskID, "attack"] call ep_fnc_missionTasks;
};


case "taskPosition": {
    [
        player,
        _taskID,
        ["Reach the designated <marker name='m_position'>coordinates</marker> to observe the area.", "Reach Position"],
        objNull,
        true
    ] call bis_fnc_taskCreate;

    [_taskID, "move"] call ep_fnc_missionTasks;
};


case "taskVehicles": {
    [
        player,
        _taskID,
        ["Destroy any knows enemy vehicles in <marker name='m_town'>town</marker> to help Alpha in assault.", "Destroy Vehicles"],
        objNull,
        true
    ] call bis_fnc_taskCreate;

    [_taskID, "destroy"] call ep_fnc_missionTasks;
};


case "taskCall": {
    [
        player,
        _taskID,
        ["Call for Alpha to start the assault.", "Call for Alpha"],
        objNull,
        "CREATED"
    ] call bis_fnc_taskCreate;

    [_taskID, "interact"] call ep_fnc_missionTasks;
};


case "taskSupport": {
    [
        player,
        _taskID,
        ["Support Alpha with anything you can to ensure operation success.", "Support the Assault"],
        objNull,
        true
    ] call bis_fnc_taskCreate;

    [_taskID, "attack"] call ep_fnc_missionTasks;
};

