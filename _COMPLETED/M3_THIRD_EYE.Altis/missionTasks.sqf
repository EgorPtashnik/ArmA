//**************************************************
// MAIN TASKS
//**************************************************

case "EPTaskGetInHeli": {
	[_taskID, "getin"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Get in the helicopter to be transported to the AO.", "Get In"],
        EP_VEH_BLU_Heli,
        true
    ] call BIS_fnc_taskCreate;
};

case "EPTaskGetOutHeli": {
	[_taskID, "getout"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Enter the AO.", "Insertion"],
        EP_insHP,
        true
    ] call BIS_fnc_taskCreate;
};

case "EPTaskScout": {
	[_taskID, "scout"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["We don't know much about their defences. Observe the enemy position and report any critical information.", "Check Enemy Defences"],
        (markerPos "EPMrkBaseArea"),
        true
    ] call BIS_fnc_taskCreate;
};

case "EPTaskSupportAssault": {
	[_taskID, "target"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Help 'Sword' to take down hostiles in the area. Provide accurate fire on crucial assets.", "Provide Sniper Support"],
        (markerPos "EPMrkBaseArea"),
        "CREATED"
    ] call BIS_fnc_taskCreate;
};

case "EPTaskDestroyConvoy": {
	[_taskID, "destroy"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Destroy enemy convoy.", "Destroy Convoy"],
        objNull,
        true
    ] call BIS_fnc_taskCreate;
};

//**************************************************
// SUBTASKS
//**************************************************
case "EPTaskKillCarGunner": {
	[_taskID, "target"] call EP_fnc_missionTasks;
    [
        player,
        [_taskID, "EPTaskSupportAssault"],
        ["", "Eliminate Machinegunner"],
        objNull,
        "CREATED"
    ] call BIS_fnc_taskCreate;
};

case "EPTaskKillSniper": {
	[_taskID, "target"] call EP_fnc_missionTasks;
    [
        player,
        [_taskID, "EPTaskSupportAssault"],
        ["", "Eliminate Sniper"],
        objNull,
        "CREATED"
    ] call BIS_fnc_taskCreate;
};

case "EPTaskKillNestGunner": {
	[_taskID, "target"] call EP_fnc_missionTasks;
    [
        player,
        [_taskID, "EPTaskSupportAssault"],
        ["", "Eliminate Machinegunner"],
        objNull,
        "CREATED"
    ] call BIS_fnc_taskCreate;
};

case "EPTaskKillPatrol": {
	[_taskID, "target"] call EP_fnc_missionTasks;
    [
        player,
        [_taskID, "EPTaskSupportAssault"],
        ["", "Eliminate Patrol"],
        objNull,
        "CREATED"
    ] call BIS_fnc_taskCreate;
};