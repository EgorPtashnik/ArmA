"BIS_tskDorida" call BIS_fnc_missionTasks;
"BIS_tskCollateralDamage" call BIS_fnc_missionTasks;

/*
"BIS_tskMaintenance" call BIS_fnc_missionTasks;
"BIS_tskFOBFind" call BIS_fnc_missionTasks;
"BIS_tskFOBDestroy" call BIS_fnc_missionTasks;
*/

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_usract_diary",
		localize "STR_A3_Tanks_M02_diary"
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [localize "STR_A3_Tanks_M02_signal", "</marker>", "<marker name = 'BIS_mrkMBT'>", "<marker name = 'BIS_mrkWiesel'>", "<marker name = 'BIS_mrkInfantryS'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [localize "STR_A3_Tanks_M02_execution", "</marker>", "<marker name = 'BIS_mrkDorida'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [localize "STR_A3_Tanks_M02_mission", "</marker>", "<marker name = 'BIS_mrkPyrgos'>", "<marker name = 'BIS_mrkDorida'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [localize "STR_A3_Tanks_M02_situation", "</marker>", "<marker name = 'BIS_mrkDorida'>", "<marker name = 'BIS_mrkAirfield'>"]
	]
];

// Zoom map on player
_null = [] spawn {
	waitUntil {!(isNull (findDisplay 37))};
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [4, 0.035, player];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
