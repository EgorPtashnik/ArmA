_timelineB =
[
	[ 
		0, 	
		{
			[markerSize "BIS_GLOBAL_zoom3", markerpos "BIS_GLOBAL_zoom3", 0, nil, true] spawn BIS_fnc_zoomOnArea;

			[(getMissionLayerEntities "GLOBAL_common") select 1, 0, true] spawn BIS_fnc_showMarkerArray;
			[(getMissionLayerEntities "INF_showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;

			["BIS_INF_alpha", 0] spawn BIS_fnc_showMarker;	
			["BIS_i_player", 0] spawn BIS_fnc_showMarker;	
			
			["BIS_INF_bravo", 0] spawn BIS_fnc_showMarker;	
			["BIS_INF_charlie", 0] spawn BIS_fnc_showMarker;	
			["BIS_INF_echo", 0] spawn BIS_fnc_showMarker;	
			["BIS_INF_specialForces", 0] spawn BIS_fnc_showMarker;

			["BIS_Evergldes", 0] spawn BIS_fnc_showMarker;	
			["BIS_Katami", 0] spawn BIS_fnc_showMarker;	

			["marker_117", 0] spawn BIS_fnc_showMarker;	
			["marker_38", 0] spawn BIS_fnc_showMarker;	
			["marker_93", 0] spawn BIS_fnc_showMarker;	
			["marker_94", 0] spawn BIS_fnc_showMarker;	
			["BIS_CampNoe", 0] spawn BIS_fnc_showMarker;		
		} 
	],
	[ 
		1.538458, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_INF_zoom0", markerpos "BIS_INF_zoom0", 2, nil, true] spawn BIS_fnc_zoomOnArea;
			sleep 1.1;

			["BIS_INF_alpha", getMarkerPos "BIS_INF_alpha_1", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_i_player", getMarkerPos "BIS_INF_alpha_1", 1, 0] spawn BIS_fnc_moveMarker;

			["BIS_INF_bravo", getMarkerPos "BIS_INF_bravo_1", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_charlie", getMarkerPos "BIS_INF_charlie_1", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_echo", getMarkerPos "BIS_INF_echo_1", 1, 0] spawn BIS_fnc_moveMarker;
		} 
	],
	[ 
		4.271806, 	
		{
			//hereRedwood
			["BIS_Redwood","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
		} 
	],
	[ 
		5.983064, 	
		{
			//strikesouth
		} 
	],
	[ 
		7.339388, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_specialForces", getMarkerPos "BIS_INF_specialForces_1", 1, 0] spawn BIS_fnc_moveMarker;
			sleep 1.1;

			["BIS_Evergldes","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
		} 
	],
	[ 
		13.221066, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_2", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_alpha", getMarkerPos "BIS_INF_alpha_3", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_i_player", getMarkerPos "BIS_INF_alpha_3", 1, 0] spawn BIS_fnc_moveMarker;

			["BIS_INF_bravo", getMarkerPos "BIS_INF_bravo_3", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_charlie", getMarkerPos "BIS_INF_charlie_2", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_specialForces", getMarkerPos "BIS_INF_specialForces_2", 1, 0] spawn BIS_fnc_moveMarker;

			sleep 2;

			["BIS_Katami","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
			["marker_86","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
		} 
	],
	[ 
		17.670317, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_3", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_INF_zoom1", markerpos "BIS_INF_zoom1", 2, nil, true] spawn BIS_fnc_zoomOnArea;
			sleep 2;

			["BIS_INF_alpha", getMarkerPos "BIS_INF_alpha_4", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_i_player", getMarkerPos "BIS_INF_alpha_4", 1, 0] spawn BIS_fnc_moveMarker;
			sleep 1.1;

			["BIS_Carlsbad","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
		} 
	],
	[ 
		20.357628, 	
		{
			//thisammo
		} 
	],
	[ 
		22.715351, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_4", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		
			//alpha, that's on you
		} 
	],
	[ 
		24.692812, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_5", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			sleep 1.5;

			["BIS_INF_echo", getMarkerPos "BIS_INF_echo_2", 1, 0] spawn BIS_fnc_moveMarker;
		} 
	],
	[ 
		28.825184, 	
		{
			//crossroadshere
			["BIS_INF_alpha", getMarkerPos "BIS_INF_echo_2", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_i_player", getMarkerPos "BIS_INF_echo_2", 1, 0] spawn BIS_fnc_moveMarker;
			sleep 1.5;

			["BIS_INF_alpha", 1] spawn BIS_fnc_hideMarker;
			["BIS_INF_echo", 1] spawn BIS_fnc_hideMarker;
			sleep 0.1;

			["BIS_INF_alphaecho", 1] spawn BIS_fnc_showMarker;
		} 
	],
	[ 
		29.576803, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_6", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			//together to yellowstone 

			sleep 1.5;

			["BIS_INF_alphaecho", getMarkerPos "BIS_INF_echo_3", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_i_player", getMarkerPos "BIS_INF_echo_3", 1, 0] spawn BIS_fnc_moveMarker;
			sleep 1.1;

			["BIS_Yellowstone","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
			["marker_29","colorBLUFOR", 2] spawn BIS_fnc_colorMarker;
		} 
	],
	[ 
		35.036417, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_7", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_INF_zoom2", markerpos "BIS_INF_zoom2", 1, nil, true] spawn BIS_fnc_zoomOnArea;

			["BIS_INF_bravo", getMarkerPos "BIS_INF_bravo_4", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_charlie", getMarkerPos "BIS_INF_charlie_3", 1, 0] spawn BIS_fnc_moveMarker;
		} 
	],
	[ 
		38.687075, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_8", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		41.273016, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_9", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_alphaecho", getMarkerPos "BIS_INF_alphaecho_1", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_i_player", getMarkerPos "BIS_INF_alphaecho_1", 1, 0] spawn BIS_fnc_moveMarker;
			
			["BIS_INF_bravo", getMarkerPos "BIS_INF_bravo_5", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_charlie", getMarkerPos "BIS_INF_charlie_4", 1, 0] spawn BIS_fnc_moveMarker;
		} 
	],
	[ 
		45.557481, 	
		{
			//alphaeasthere
		} 
	],
	[ 
		46.292676, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_10", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_uavStart", getMarkerPos "BIS_INF_uav", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_INF_uavStart", 2] spawn BIS_fnc_showMarker;
			sleep 2.1;

			["BIS_INF_uavStart"] spawn BIS_fnc_blinkMarker;
		} 
	],
	[ 
		50.924082, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_11", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		52.326463, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_12", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_INF_zoom0", markerpos "BIS_INF_zoom0", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		53.188435, 	
		{
			["to_c02_m02_brief_002_br_inf_briefing_GUARDIAN_13", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],

	/*
	[ 
		2, 	
		{
			[markerSize "BIS_INF_zoom1", markerpos "BIS_INF_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		4, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_B_brief_01";
			["to_c02_m02_B_brief_01", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		5, 	
		{	
			_arrayTemp = ["BIS_INF_alphaMovement_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		8, 	
		{		
			_arrayTemp = ["BIS_INF_bravoMovement_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;	
		} 
	],
	[ 
		12, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_B_brief_02";
			["to_c02_m02_B_brief_02", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_specialForces", 2] spawn BIS_fnc_showMarker;	
			["BIS_INF_specialForcesArrow", 2] spawn BIS_fnc_showMarker;		
		} 
	],
	[ 
		16, 	
		{
			[markerSize "BIS_INF_zoom2", markerpos "BIS_INF_zoom2", 3, nil, true] spawn BIS_fnc_zoomOnArea;		
		} 
	],
	[ 
		18, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_B_brief_03";
			["to_c02_m02_B_brief_03", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_LineOfDefense", 2] spawn BIS_fnc_showMarker;	
			["BIS_INF_LineWarning", 2] spawn BIS_fnc_showMarker;		
		} 
	],
	[ 
		26, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_B_brief_04";
			["to_c02_m02_B_brief_04", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_INF_bravoAdvance_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;		
		} 
	],
	[ 
		31, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_B_brief_05";
			["to_c02_m02_B_brief_05", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_INF_zoom3", markerpos "BIS_INF_zoom3", 3, nil, true] spawn BIS_fnc_zoomOnArea;		
		} 
	],
	[ 
		34, 	
		{
			["BIS_INF_LineOfDefense", 2] spawn BIS_fnc_hideMarker;	
			["BIS_INF_LineWarning", 2] spawn BIS_fnc_hideMarker;		
		} 
	],
	[ 
		36, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_B_brief_06";
			["to_c02_m02_B_brief_06", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_INF_alphaAdvance_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;			
		} 
	],
	[ 
		38.5, 	
		{	
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_B_brief_07";
			["to_c02_m02_B_brief_07", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_INF_bravoAttack", 2] spawn BIS_fnc_showMarker;			
		} 
	],
	[ 
		42, 	
		{
			[markerSize "BIS_INF_zoom4", markerpos "BIS_INF_zoom4", 3, nil, true] spawn BIS_fnc_zoomOnArea;		
		} 
	],
	*/


	[ 58.2,	{} ]
];