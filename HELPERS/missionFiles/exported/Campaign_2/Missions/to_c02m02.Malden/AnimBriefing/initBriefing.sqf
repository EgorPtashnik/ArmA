//Disable environment sounds
enableEnvironment false;

//Disable player simulation during the briefing
player enableSimulation false;

//Wait 2 seconds. This is NEEDED else it won't work properly on restart (scripts take too much time to get initialized)
titlecut ["","BLACK FADED"];
waituntil {!isnil "bis_fnc_init"};

//Setup Special Forces markers depending on whether the start position of SF is (set in the init.sqf script)
if(SpecStart == "BIS_start02") then
{
	"BIS_SF_specialStart" setMarkerPos (getMarkerPos "BIS_SF_specialStart_alt");
	"BIS_SF_specialStart" setMarkerDir (markerDir "BIS_SF_specialStart_alt");

	"BIS_sf_unit" setMarkerPos (getMarkerPos "BIS_sf_unit_alt");
	"BIS_sf_player" setMarkerPos (getMarkerPos "BIS_sf_unit_alt");
	"BIS_sf_unitFinal" setMarkerPos (getMarkerPos "BIS_sf_unit_alt");
};

//include both briefings and tools
#include "AnimBrief_c02_m02_GLOBAL.sqf";

//hide map controls (diary and so on)
[false] call BIS_fnc_TO_showMapControls;

// - First Briefing -
[_timelineA, 0, nil, allMapMarkers, (getMissionLayerEntities "GLOBAL_showAtEnd") select 1, "BIS_GLOBAL_zoom3", false] spawn BIS_fnc_animatedBriefing;


//Disable map textures
//waitUntil { !isNull findDisplay 12 };
//ctrlActivate ( ( findDisplay 12 ) displayCtrl 107 );


//Wait until timeline is over
waitUntil{!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]);};

// - Second Briefing -
disableSerialization;

_listOfMissions =
[
	[
		getmarkerPos "BIS_GLOBAL_infantryIcon",
		localize "STR_A3_TO_c02m02_SelectInfantry",
		format
		[
			"%1<t size='0.2' color='#00000000'>-<br /></t><t size='0.5' color='#00000000'>-<br /></t><t size='0.8'>%2</t><br /><t size='0.5' color='#00000000'>-<br />",
			localize "STR_A3_TO_c02m02_SelectInfantry", 				// %1
			localize "STR_A3_TO_c02m02_SelectInfantryDescription" 		//%2
		],
		"a3\Missions_F_Tacops\data\img\campaign2_role_inf_ca.paa",
		{
			#include "AnimBrief_c02_m02_INF.sqf";
			private _borderMarkers = [] call BIS_fnc_getBorderMarkers;

			private _endCode =
			{
				{
					_x setMarkerColor "colorOPFOR";
				}
				forEach ["BIS_Evergldes", "BIS_Redwood", "BIS_Katami", "BIS_Carlsbad", "BIS_Yellowstone", "marker_29", "marker_86"];
			};

			[_timelineB, 0, nil, allMapMarkers, ["BIS_CampNoe","marker_94","marker_93","marker_38","marker_117", "BIS_Evergldes", "BIS_Katami", "BIS_sf_unit" , "BIS_GLOBAL_infantryStart","marker_19","BIS_LaTrinite"] + ((getMissionLayerEntities "GLOBAL_common") select 1) + _borderMarkers + ((getMissionLayerEntities "INF_showAtEnd") select 1), "BIS_INF_zoom0", true, _endCode] spawn BIS_fnc_animatedBriefing;
		}
	],

	[
		getmarkerPos "BIS_GLOBAL_specialIcon",
		localize "STR_A3_TO_c02m02_SelectSpecial",
		format
		[
			"%1<t size='0.2' color='#00000000'>-<br /></t><t size='0.5' color='#00000000'>-<br /></t><t size='0.8'>%2</t><br /><t size='0.5' color='#00000000'>-<br />",
			localize "STR_A3_TO_c02m02_SelectSpecial", 				// %1
			localize "STR_A3_TO_c02m02_SelectSpecialDescription"	// %2
		],
		"a3\Missions_F_Tacops\data\img\campaign2_role_spec_ca.paa",
		{
			#include "AnimBrief_c02_m02_SF.sqf";
			private _borderMarkers = [] call BIS_fnc_getBorderMarkers;

			private _endCode =
			{
				if(SpecStart == "BIS_start02") then
				{
					["BIS_SF_Arches", 0] spawn BIS_fnc_showMarker;
				}
				else
				{
					["BIS_SF_Acadia", 0] spawn BIS_fnc_showMarker;
				};

				{
					_x setMarkerColor "colorOPFOR";
				}
				forEach ["BIS_SF_Congaree", "BIS_SF_Denali", "BIS_SF_Acadia", "BIS_SF_Arches"];
			};

			[_timelineC, 0, nil, allMapMarkers, ["BIS_CampNoe","marker_94","marker_93","marker_38","marker_117", "BIS_Evergldes", "BIS_Sequoia", "BIS_Redwood","marker_19","BIS_LaTrinite","BIS_INF_charlie_5","BIS_INF_bravo_6","BIS_INF_alpha_final_1","marker_41","marker_42","marker_96"] + _borderMarkers + ((getMissionLayerEntities "SF_showAtEnd") select 1), "BIS_SF_zoom0", true, _endCode] spawn BIS_fnc_animatedBriefing;
		}
	]
];

//Launch new mission selector with animated icons
private _missionChosen = [markerSize "BIS_GLOBAL_zoom3", getMarkerPos "BIS_GLOBAL_zoom3", _listOfMissions] call BIS_fnc_missionSelector;

//Wait for timeline to initialize and set eventTime_playing to true
Sleep 2;

//Wait until timeline is over
waitUntil{!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]);};

//show map controls (diary and so on)
//map controls now shown in missionFlow FSM
//[true] call BIS_fnc_TO_showMapControls;

//enable player simulatiomn
player enableSimulation true;

//Disable environment sounds
enableEnvironment true;

//choose mission type depending on what icon we clicked on
switch(_missionChosen) do
{
	case 0:
	{
		BIS_infantry = true;
	};
	case 1:
	{
		BIS_Special = true;
	};
};

//Give the FSM time to teleport the player to its correct position
sleep 1;