case "Defend": {
	[_taskID, "defend"] call EP_fnc_missionTasks;
    private _taskDescription = format ["%1<br/>%2<br/>",
        "Our forces are in ongoing retreat process from the island.",
        "Hold your part of the frontline as long as you can until furhter orders."
    ];

    [ player, _taskID, [_taskDescription, "Hold Position"], [4092.05,4596.75,10], true ] call BIS_fnc_taskCreate;
};

case "Retreat": {
	[_taskID, "run"] call EP_fnc_missionTasks;
    private _taskDescription = format ["%1<br/>%2<br/>",
        "CSAT evacuation is nearly completed.",
        "Move back from your position and meet extraction helicopter to leave the island behind."
    ];

    [ player, _taskID, [_taskDescription, "Retreat"], markerPos "O_EvacSpawnPos", true ] call BIS_fnc_taskCreate;
};

case "Hold": {
	[_taskID, "wait"] call EP_fnc_missionTasks;
    private _taskDescription = format ["%1<br/>",
        "Wait until frinedly helicopter arrives and get the hell out of this island."
    ];

    [ player, _taskID, [_taskDescription, "Wait for Extraction"], markerPos "O_EvacSpawnPos", true ] call BIS_fnc_taskCreate;
};