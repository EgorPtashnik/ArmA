"BIS_tskDefense" call BIS_fnc_missionTasks;

/*
"BIS_tskInvestigateTank" call BIS_fnc_missionTasks;
"BIS_tskDestroyTank" call BIS_fnc_missionTasks;
"BIS_tskDestroyArmata" call BIS_fnc_missionTasks;
*/

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_usract_diary",
		localize "STR_A3_Tanks_M03_diary"
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		localize "STR_A3_Tanks_M03_signal"
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [localize "STR_A3_Tanks_M03_execution", "</marker>", "<marker name = 'BIS_mrkArmata'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [localize "STR_A3_Tanks_M03_mission", "</marker>", "<marker name = 'BIS_mrkStart'>"]
	]
];

BIS_ARPlayer createDiaryRecord
[
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [localize "STR_A3_Tanks_M03_situation", "</marker>", "<marker name = 'BIS_mrkAirfield'>"]
	]
];

// Zoom map on player
_null = [] spawn {
	waitUntil {!(isNull (findDisplay 37))};
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [4, 0.035, player];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
