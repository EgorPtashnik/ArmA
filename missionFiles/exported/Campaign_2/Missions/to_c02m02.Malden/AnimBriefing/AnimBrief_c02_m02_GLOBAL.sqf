//opening briefing
_timelineA =
[
	[ 
		0, 	
		{
			[markerSize "BIS_GLOBAL_zoom0", markerpos "BIS_GLOBAL_zoom0", 0, nil, true] spawn BIS_fnc_zoomOnArea;

			[(getMissionLayerEntities "GLOBAL_showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		1.522404, 	
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_GLOBAL_zoom1", markerpos "BIS_GLOBAL_zoom1", 7, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		3.033197,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		5.371633,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_2", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			//[markerSize "BIS_GLOBAL_zoom1", markerpos "BIS_GLOBAL_zoom1", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		11.268573,
		{
			//heli here	
			["BIS_G_heli_1", 1] spawn BIS_fnc_showMarker;
			sleep 1.1;
			["BIS_G_heli_1",1,1] spawn BIS_fnc_blinkMarker;
			["BIS_G_heli_1",1,2] spawn BIS_fnc_cancelMarker;
			sleep 2;

			["BIS_G_heli_1", 1] spawn BIS_fnc_hideMarker;
		} 
	],
	[ 
		12.285287,
		{
			//heli here
			["BIS_G_heli_2", 1] spawn BIS_fnc_showMarker;	
			sleep 1.1;
			["BIS_G_heli_2",1,1] spawn BIS_fnc_blinkMarker;
			["BIS_G_heli_2",1,2] spawn BIS_fnc_cancelMarker;
			sleep 2;

			["BIS_G_heli_2", 1] spawn BIS_fnc_hideMarker;
		} 
	],
	[ 
		13.115624,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_3", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			sleep 1;

			_arrayTemp = ["BIS_g_defenseLine_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;

			sleep 3;

			_arrayTemp2 = ["BIS_g_natoInf", "BIS_g_csatInf", "BIS_g_natoArmor"];
			[_arrayTemp2, 2, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		16.335193,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_4", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		20.571497,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_5", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_GLOBAL_zoom2", markerpos "BIS_GLOBAL_zoom2", 10, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		21.994898,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_6", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_g_islandCsat_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		27.133265,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_7", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		33.043175,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_8", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		35.483288,
		{
			["to_c02_m02_brief_001_br_briefing_GUARDIAN_9", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_GLOBAL_zoom3", markerpos "BIS_GLOBAL_zoom3", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		38.186060,
		{
			//final push
			["BIS_GLOBAL_infantryStart", getMarkerPos "BIS_GLOBAL_infantry", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_GLOBAL_infantryStart", 2] spawn BIS_fnc_showMarker;

			["BIS_GLOBAL_specialStart", getMarkerPos "BIS_GLOBAL_special", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_GLOBAL_specialStart", 2] spawn BIS_fnc_showMarker;
		} 
	],
	
	/*
	[ 
		0, 	
		{
			[markerSize "BIS_GLOBAL_zoom0", markerpos "BIS_GLOBAL_zoom0", 0, nil, true] spawn BIS_fnc_zoomOnArea;

			[(getMissionLayerEntities "GLOBAL_showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		3,     
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_A_brief_01";
			["to_c02_m02_A_brief_01", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_GLOBAL_enemyInf_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;			
		} 
	],
	[ 
		5,     
		{
			_arrayTemp = ["BIS_GLOBAL_enemyInfCross_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;			
		} 
	],
	[ 
		7, 	
		{
			_arrayTemp = ["BIS_GLOBAL_chapoi", "BIS_GLOBAL_chapoiFlag", "BIS_GLOBAL_cancon", "BIS_GLOBAL_canconFlag", "BIS_GLOBAL_lariviere", "BIS_GLOBAL_lariviereFlag"];
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;

			_arrayTemp = ["BIS_GLOBAL_enemyInfCross_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_hideMarkerArray;
			_arrayTemp = ["BIS_GLOBAL_enemyInf_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_hideMarkerArray;
		} 
	],
	[ 
		11, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_A_brief_02";
			["to_c02_m02_A_brief_02", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_GLOBAL_zoomPessagne", markerpos "BIS_GLOBAL_zoomPessagne", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		17, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_A_brief_03";
			["to_c02_m02_A_brief_03", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_GLOBAL_zoomNorth", markerpos "BIS_GLOBAL_zoomNorth", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		22, 	
		{
			_arrayTemp = ["BIS_GLOBAL_heli_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		24, 	
		{
			_arrayTemp = ["BIS_GLOBAL_heliCross_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		27, 	
		{
			["BIS_GLOBAL_stLouisBlink"] spawn BIS_fnc_blinkMarker;	
		} 
	],
	[ 
		30, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_A_brief_04";
			["to_c02_m02_A_brief_04", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_GLOBAL_mortar", 1] spawn BIS_fnc_showMarker;	
			["BIS_GLOBAL_mortarArrow", 1] spawn BIS_fnc_showMarker;	
		} 
	],
	[ 
		32, 	
		{
			["BIS_GLOBAL_mortar"] spawn BIS_fnc_blinkMarker;	
			["BIS_GLOBAL_mortarArrow"] spawn BIS_fnc_blinkMarker;	
		} 
	],
	[ 
		35, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_A_brief_05";
			["to_c02_m02_A_brief_05", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_GLOBAL_zoom2", markerpos "BIS_GLOBAL_zoom2", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		39,     
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_A_brief_06";
			["to_c02_m02_A_brief_06", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_GLOBAL_houdan", "BIS_GLOBAL_houdanFlag", "BIS_GLOBAL_dourdan", "BIS_GLOBAL_dourdanFlag"];
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		43,     
		{
			["BIS_GLOBAL_combined", 2] spawn BIS_fnc_showMarker;	
		} 
	],
	[ 
		46,     
		{
			[markerSize "BIS_GLOBAL_zoom1", markerpos "BIS_GLOBAL_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;	
		} 
	],
	[ 
		50, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_A_brief_07";
			["to_c02_m02_A_brief_07", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_GLOBAL_dangerZone", "BIS_GLOBAL_dangerQuestion"];
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		54, 	
		{
			_arrayTemp = ["BIS_GLOBAL_specialIcon", "BIS_GLOBAL_special"];
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		57, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_A_brief_08";
			["to_c02_m02_A_brief_08", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_GLOBAL_infantryIcon", "BIS_GLOBAL_infantry"];
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		61, 	
		{
			[markerSize "BIS_GLOBAL_zoom3", markerpos "BIS_GLOBAL_zoom3", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	*/

	[ 43.2,	{} ]
];