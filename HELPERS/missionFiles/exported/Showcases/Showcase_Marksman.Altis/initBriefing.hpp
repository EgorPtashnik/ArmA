"BIS_tskVilla" call BIS_fnc_missionTasks;
"BIS_tskIntel" call BIS_fnc_missionTasks;
/*
"BIS_tskLZ" call BIS_fnc_missionTasks;
"BIS_tskGetIn" call BIS_fnc_missionTasks;
"BIS_tskStartAttack" call BIS_fnc_missionTasks;
"BIS_tskCamp" call BIS_fnc_missionTasks;
*/

["BIS_tskVilla", "Current"] call BIS_fnc_missionTasks;

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		localize "STR_A3_Showcase_Marksman_Briefing_Signal_text"
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		localize "STR_A3_Showcase_Marksman_Briefing_Execution_text"
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [localize "STR_A3_Showcase_Marksman_Briefing_Mission_text", "</marker>", "<marker name = 'BIS_mrkVillaArea'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		localize "STR_A3_Showcase_Marksman_Briefing_Situation_text"
	]
];

BIS_player createDiarySubject [
  "Showcase",
  localize "STR_A3_Diary_Showcase_title"
 ];
 
 BIS_player createDiaryRecord [
  "Showcase",
  [
   localize "STR_A3_Diary_Summary_title",
   "<img image = 'a3\Missions_F_Mark\data\img\Showcase_Marksman_briefing_CA.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Marksman_Showcase_Summary_text"
  ]
 ];

 //--- Select "Showcase" subject by default
 [] spawn {
 disableserialization;
 _diary = finddisplay 37;
 _diaryList = _diary displayctrl 1001;
 waituntil {lbsize _diaryList > 4};
 _diaryList lbsetcursel 4;
};

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.325, markerPos "BIS_mrk_BriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
