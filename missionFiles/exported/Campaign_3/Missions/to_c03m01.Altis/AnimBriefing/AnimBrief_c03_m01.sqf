_timelineA =
[
	[ 
		0, 	
		{
			[markerSize "mrk_rect_1", markerpos "mrk_rect_1", 0, nil, true] spawn BIS_fnc_zoomOnArea;

			[(getMissionLayerEntities "showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;

			BIS_AirAssaultSpeaker1 = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];
			BIS_AirAssaultSpeaker1 say2D "vtolInt";

			BIS_AirAssaultSpeakerHeadphones = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];
			BIS_AirAssaultSpeakerHeadphones say2D "vtolHeadphones";
		} 
	],
	
	[ 
		1.492472, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_0", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		3.170023, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_1", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;					
		} 
	],
	[ 
		4.388367, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_2", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		6.792290, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_3", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		9.762018, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_4", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		12.214, 	
		{
			["marker_6", 1] spawn BIS_fnc_showMarker;
		} 
	],
	[ 
		13.0, 	
		{
			["marker_36", 1] spawn BIS_fnc_showMarker;
		} 
	],
	[ 
		13.917868, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_5", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		16.188798, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_6", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		23.102948, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_7", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		23.719524, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_8", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		29.331156, 	
		{
			//bark
			//["to_c03_m01_brief_001_br_briefing_BARKLEM_0", "BARKLEM", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		30.397823, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_9", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		34.052857, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_10", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;	

			[markerSize "mrk_rect_2", markerpos "mrk_rect_2", 1, nil, true] spawn BIS_fnc_zoomOnArea;

			sleep 1;

			["mrk_lz_2", 1] spawn BIS_fnc_showMarker;

			["BIS_mustangHighlight", 1] spawn BIS_fnc_showMarker;
			sleep 1.1;
			["BIS_mustangHighlight", 1] spawn BIS_fnc_hideMarker;	
		} 
	],
	[ 
		37.190, 	
		{
			["mrk_lz", 1] spawn BIS_fnc_showMarker;
			["marker_18", 1] spawn BIS_fnc_showMarker;

			
			["BIS_blazerHighlight", 1] spawn BIS_fnc_showMarker;
			sleep 1.1;
			["BIS_blazerHighlight", 1] spawn BIS_fnc_hideMarker;	
		} 
	],
	[ 
		38.377982, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_11", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;	

			["BIS_mustangArrowStart", getMarkerPos "BIS_mustangArrow", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_mustangArrowStart", 2] spawn BIS_fnc_showMarker;

			["BIS_blazerArrowStart", getMarkerPos "BIS_blazerArrow", 1, 0] spawn BIS_fnc_moveMarker;
			["BIS_blazerArrowStart", 2] spawn BIS_fnc_showMarker;	
		} 
	],
	[ 
		39.657, 	
		{
			["marker_9"] spawn BIS_fnc_blinkMarker;
		} 
	],
	[ 
		43.0, 	
		{
			//pilot0	
			["to_c03_m01_brief_001_br_briefing_PILOT02_0", localize "STR_a3_c_man_pilot_f0", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;	
		} 
	],
	[ 
		44.5, 	
		{
			//ramp
			BIS_AirAssaultSpeaker2 = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];
			BIS_AirAssaultSpeaker2 say2D "vtolRamp";

			BIS_AirAssaultSpeaker3 = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];
			BIS_AirAssaultSpeaker3 say2D "vtolExt";	

			sleep 1.5;

			deleteVehicle BIS_AirAssaultSpeaker1;
			deleteVehicle BIS_AirAssaultSpeaker2;
		} 
	],
	[ 
		47.008073, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_12", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		48.723673, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_13", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		51.343129, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_14", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;	

			[markerSize "mrk_rect_3", markerpos "mrk_rect_3", 1, nil, true] spawn BIS_fnc_zoomOnArea;	
		} 
	],
	[ 
		51.983, 	
		{
			sleep 1;

			["marker_12", 1] spawn BIS_fnc_showMarker;
			["marker_13", 1] spawn BIS_fnc_showMarker;
			sleep 1.1;
			
			sleep 2;

			_arrayTemp = ["marker_15", "marker_16", "marker_25"];
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;

			sleep 1;

			_arrayTemp2 = ["marker_35", "marker_34", "marker_33"];
			[_arrayTemp2, 2, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		55.790113, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_15", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		58.470476, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_16", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;	

			[markerSize "mrk_rect_1", markerpos "mrk_rect_1", 6, nil, true] spawn BIS_fnc_zoomOnArea;		
		} 
	],
	[ 
		63.198707, 	
		{
			//pilot1
			["to_c03_m01_brief_001_br_briefing_PILOT02_1", localize "STR_a3_c_man_pilot_f0", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;			
		} 
	],
	[ 
		66.937460, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_17", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		68.674150, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_18", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],
	[ 
		72.298730, 	
		{
			["to_c03_m01_brief_001_br_briefing_BOWKER_19", "BOWKER", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		} 
	],

	/*
	[ 
		5.771521, 
		{
			[(getMissionLayerEntities "Markers 1") select 1,8] spawn BIS_fnc_showMarkerArray;
			["Commander","Prepare, one minute to landing."] call BIS_fnc_showSubtitle;
		}
	],
	[ 
		10, 
		{
			["Commander","This is it, last time check on situation."] call BIS_fnc_showSubtitle;
		}
	],
	[ 
		15, 
		{
			[(getMissionLayerEntities "Markers 2") select 1,5] spawn BIS_fnc_showMarkerArray;
			//["b_05"] spawn BIS_fnc_missionConversations;
			//_markerZoom = "BIS_mrkh_Zoom_A_2";
			//_xHandle = [markerSize _markerZoom, markerpos _markerZoom, 4, nil, true] spawn BIS_fnc_zoomOnArea;
			["Commander","LZ Mustang and Stallion should be clear, Chalkeia should be ours within hour."] call BIS_fnc_showSubtitle;
		}
	],
	[ 
		25, 
		{
			[(getMissionLayerEntities "Markers 3") select 1,5] spawn BIS_fnc_showMarkerArray;
			//["b_10"] spawn BIS_fnc_missionConversations;
			//_markerZoom = "BIS_mrkh_Zoom_A_2";
			_xHandle = [markerSize "mrk_rect_2", markerpos "mrk_rect_2", 4, nil, true] spawn BIS_fnc_zoomOnArea;
			["Commander","Special forces on ground are blocking enemy reinforcements."] call BIS_fnc_showSubtitle;
		}
	],
	*/

	[ 75.0,	{} ]
];