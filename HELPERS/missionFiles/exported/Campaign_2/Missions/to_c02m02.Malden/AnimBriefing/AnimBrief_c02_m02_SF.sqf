_timelineC =
[
	[ 
		0, 	
		{
			[markerSize "BIS_GLOBAL_zoom3", markerpos "BIS_GLOBAL_zoom3", 0, nil, true] spawn BIS_fnc_zoomOnArea;

			[(getMissionLayerEntities "GLOBAL_common") select 1, 0, true] spawn BIS_fnc_showMarkerArray;
			[(getMissionLayerEntities "SF_showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;

			//["BIS_Sequoia", 0] spawn BIS_fnc_hideMarker;

			["BIS_sf_unit", 0.1] spawn BIS_fnc_showMarker;
			["BIS_sf_player", 0.1] spawn BIS_fnc_showMarker;

			["marker_117", 0] spawn BIS_fnc_showMarker;	
			["marker_38", 0] spawn BIS_fnc_showMarker;	
			["marker_93", 0] spawn BIS_fnc_showMarker;	
			["marker_94", 0] spawn BIS_fnc_showMarker;	
			["BIS_CampNoe", 0] spawn BIS_fnc_showMarker;	
		} 
	],
	[ 
		1.502744, 	
		{
			["to_c02_m02_brief_003_br_sf_briefing_in_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_SF_zoom0", markerpos "BIS_SF_zoom0", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		2.845057, 	
		{
			["to_c02_m02_brief_003_br_sf_briefing_in_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		5.101388, 	
		{
			//redwood here
			["BIS_Redwood", 1] spawn BIS_fnc_showMarker;

			["BIS_SF_alphaStart", 1] spawn BIS_fnc_showMarker;
			["BIS_SF_bravoStart", 1] spawn BIS_fnc_showMarker;
			["BIS_SF_charlieStart", 1] spawn BIS_fnc_showMarker;

			sleep 1;

			["BIS_SF_alphaStart", getMarkerPos "BIS_SF_alpha", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_SF_bravoStart", getMarkerPos "BIS_SF_bravo", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_SF_charlieStart", getMarkerPos "BIS_SF_charlie", 1, 0] spawn BIS_fnc_moveMarker;

		} 
	],
	[ 
		7.722268, 	
		{
			["to_c02_m02_brief_003_br_sf_briefing_in_GUARDIAN_2", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		10.481746, 	
		{
			["to_c02_m02_brief_003_br_sf_briefing_in_GUARDIAN_3", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			sleep 2;
			["BIS_sf_redArea", 1] spawn BIS_fnc_showMarker;
		} 
	],
	[ 
		12.606480, 	
		{
			//thisforest
		} 
	],
	[ 
		15.494376, 	
		{
			//0A
			if(SpecStart == "BIS_start02") then
			{
				["to_c02_m02_brief_005_br_sf_briefing_arches_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
				sleep 0.5;

				["BIS_SF_Arches", 2] spawn BIS_fnc_showMarker;
			}
			else
			{
				["to_c02_m02_brief_004_br_sf_briefing_acadia_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
				sleep 0.5;

				["BIS_SF_Acadia", 2] spawn BIS_fnc_showMarker;
			};

			sleep 2.5;

			["BIS_SF_Denali", 2] spawn BIS_fnc_showMarker;
			["BIS_SF_Congaree", 2] spawn BIS_fnc_showMarker;	
		} 
	],
	[ 
		20.509297, 	
		{
			//0OUT
			["to_c02_m02_brief_006_br_sf_briefing_out_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		22.619025, 	
		{
			["to_c02_m02_brief_006_br_sf_briefing_out_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		24.797933, 	
		{
			//proceed
			["BIS_sf_unit", getMarkerPos "BIS_sf_unit_1", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_sf_player", getMarkerPos "BIS_sf_unit_1", 1, 0] spawn BIS_fnc_moveMarker;

			["BIS_Sequoia", 1] spawn BIS_fnc_showMarker;
			["BIS_Evergldes", 2] spawn BIS_fnc_showMarker;

			["BIS_SF_Congaree","colorBLUFOR", 1] spawn BIS_fnc_colorMarker;
			["BIS_SF_Denali","colorBLUFOR", 1] spawn BIS_fnc_colorMarker;
			["BIS_SF_Acadia","colorBLUFOR", 1] spawn BIS_fnc_colorMarker;
			["BIS_SF_Arches","colorBLUFOR", 1] spawn BIS_fnc_colorMarker;

			sleep 1.5;
			[markerSize "BIS_SF_zoom1", markerpos "BIS_SF_zoom1", 1, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		26.907664, 	
		{
			["to_c02_m02_brief_006_br_sf_briefing_out_GUARDIAN_2", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		28.481308, 	
		{
			//prepare
			["BIS_SF_ambush", 2] spawn BIS_fnc_showMarker;
			sleep 0.5;
		} 
	],
	[ 
		31.092526, 	
		{
			//reinforce
			["BIS_sf_csatStart", getMarkerPos "BIS_sf_csat", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_sf_csatStart", 2] spawn BIS_fnc_showMarker;

			sleep 2.1;

			["BIS_sf_csatStart",1,1.2] spawn BIS_fnc_cancelMarker;
			sleep 1.2;

			["BIS_sf_csatStart", 1] spawn BIS_fnc_hideMarker;
			["BIS_SF_ambush", 1] spawn BIS_fnc_hideMarker;
		} 
	],
	[ 
		34.239819, 	
		{
			["to_c02_m02_brief_006_br_sf_briefing_out_GUARDIAN_3", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			sleep 0.5;
			["BIS_sf_unit", getMarkerPos "BIS_sf_unit_2", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_sf_player", getMarkerPos "BIS_sf_unit_2", 1, 0] spawn BIS_fnc_moveMarker;
		} 
	],
	[ 
		38.009660, 	
		{
			["to_c02_m02_brief_006_br_sf_briefing_out_GUARDIAN_4", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_SF_zoom0", markerpos "BIS_SF_zoom0", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		38.866213, 	
		{
			["to_c02_m02_brief_006_br_sf_briefing_out_GUARDIAN_5", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],


	/*
	[ 
		2, 	
		{
			[markerSize "BIS_SF_zoom1", markerpos "BIS_SF_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		5, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_C_brief_01";
			["to_c02_m02_C_brief_01", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;	

			["BIS_SF_specialStart", 2] spawn BIS_fnc_showMarker;		
		} 
	],
	[ 
		8, 	
		{
			_arrayTemp = ["BIS_SF_question"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;		
		} 
	],
	[ 
		12, 	
		{
			["BIS_SF_question1"] spawn BIS_fnc_blinkMarker;
			["BIS_SF_question2"] spawn BIS_fnc_blinkMarker;	
			["BIS_SF_question3"] spawn BIS_fnc_blinkMarker;			
		} 
	],
	[ 
		16, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker2 say2D "to_c02_m02_C_brief_02";
			["to_c02_m02_C_brief_02", "HQ", BIS_fnc_AnimatedBriefing_speaker2] call BIS_fnc_TO_playSoundAndSubtitles;	

			[markerSize "BIS_SF_zoom2", markerpos "BIS_SF_zoom2", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		19, 	
		{
			["BIS_SF_ambush", 2] spawn BIS_fnc_showMarker;	
			["BIS_SF_ambushRect", 2] spawn BIS_fnc_showMarker;		
		} 
	],
	[ 
		26, 	
		{
			//BIS_fnc_AnimatedBriefing_speaker1 say2D "to_c02_m02_C_brief_03";
			["to_c02_m02_C_brief_03", "HQ", BIS_fnc_AnimatedBriefing_speaker1] call BIS_fnc_TO_playSoundAndSubtitles;	

			["BIS_SF_attackHoudan", 2] spawn BIS_fnc_showMarker;		
		} 
	],
	[ 
		29, 	
		{
			[markerSize "BIS_SF_zoom1", markerpos "BIS_SF_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	*/

	

	[ 45.9,	{} ]
];