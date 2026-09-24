"BIS_tskEquipment" call BIS_fnc_missionTasks;
"BIS_tskGetIn" call BIS_fnc_missionTasks;
"BIS_tskCheckpointA" call BIS_fnc_missionTasks;

/*
"BIS_tskCheckpointB" call BIS_fnc_missionTasks;
"BIS_tskCollateralDamage" call BIS_fnc_missionTasks;
"BIS_tskForest" call BIS_fnc_missionTasks;
"BIS_tskRTB" call BIS_fnc_missionTasks;
"BIS_tskAttack" call BIS_fnc_missionTasks;
"BIS_tskMaintenance" call BIS_fnc_missionTasks;
*/

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_usract_diary",
		localize "STR_A3_Tanks_M01_diary"
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		localize "STR_A3_Tanks_M01_signal"
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [localize "STR_A3_Tanks_M01_execution", "</marker>", "<marker name = 'BIS_mrkArmory'>", "<marker name = 'BIS_mrkWiesel'>", "<marker name = 'BIS_mrkCheckpointA'>", "<marker name = 'BIS_mrkCheckpointB'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [localize "STR_A3_Tanks_M01_mission","</marker>", "<marker name = 'BIS_mrkCheckpointA'>", "<marker name = 'BIS_mrkCheckpointB'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		localize "STR_A3_Tanks_M01_situation"
	]
];

// Zoom map on player
_null = [] spawn {
	waitUntil {!(isNull (findDisplay 37))};
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [4, 0.035, player];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
