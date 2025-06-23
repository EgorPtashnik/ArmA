_timelineA =
[
	[ 
		0, 	
		{
			[markerSize "BIS_zoom0", markerpos "BIS_zoom0", 0, nil, true] spawn BIS_fnc_zoomOnArea;
			[(getMissionLayerEntities "showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;
			//["br_briefing"] spawn BIS_fnc_missionConversations;
		} 
	],

	[ 
		1.517846, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_0", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_zoom1", markerpos "BIS_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		5.801519, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_1", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		11.097120, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_2", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		14.976032, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_3", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		17.337, 	
		{
			//surrounded
			_arrayTemp = ["BIS_surround_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		18.585125, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_4", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		24.150544, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_5", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_zoom2", markerpos "BIS_zoom2", 1, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		25, 	
		{
			_arrayTemp = ["mrk_lz", "marker_8"];
			[_arrayTemp, 2, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		28.231859, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_6", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		32.380635, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_7", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		40.172222, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_8", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		41.555125, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_9", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		45.636440, 	
		{
			//par0
			["to_c03_m02_brief_001_br_briefing_PARIAH_0", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		47.930068, 	
		{
			//par1
			["to_c03_m02_brief_001_br_briefing_PARIAH_1", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_zoom3", markerpos "BIS_zoom3", 1, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		48.503, 	
		{
			["mrk_village", 2] spawn BIS_fnc_showMarker;

			["BIS_superiorHighlight", 1] spawn BIS_fnc_showMarker;
			sleep 1.1;
			["BIS_superiorHighlight", 1] spawn BIS_fnc_hideMarker;
		} 
	],
	[ 
		55.047052, 	
		{
			//par2
			["to_c03_m02_brief_001_br_briefing_PARIAH_2", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_zoom1", markerpos "BIS_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		60.781134, 	
		{
			//par3
			["to_c03_m02_brief_001_br_briefing_PARIAH_3", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		62.872, 	
		{
			["BIS_firstArrows_1", 2] spawn BIS_fnc_showMarker;
		} 
	],
	[ 
		67.796916, 	
		{
			//par4
			["to_c03_m02_brief_001_br_briefing_PARIAH_4", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		70.563, 	
		{
			["BIS_firstArrows_2", 2] spawn BIS_fnc_showMarker;
		} 
	],
	[ 
		72.553, 	
		{
			["BIS_ancientRuinsHighlight", 1] spawn BIS_fnc_showMarker;
			sleep 1.1;
			["BIS_ancientRuinsHighlight", 1] spawn BIS_fnc_hideMarker;
		} 
	],
	[ 
		74.273061, 	
		{
			//par5
			["to_c03_m02_brief_001_br_briefing_PARIAH_5", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		78.455556, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_10", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		80.344422, 	
		{
			//par6
			["to_c03_m02_brief_001_br_briefing_PARIAH_6", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		81.828549, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_11", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			[markerSize "BIS_zoom0", markerpos "BIS_zoom0", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
/*
	[ 
		86.254694, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_12", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		87.157846, 	
		{
			//par7
			["to_c03_m02_brief_001_br_briefing_PARIAH_7", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		91.610181, 	
		{
			["to_c03_m02_brief_001_br_briefing_COLLINS_13", "COLLINS", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
	[ 
		93.431587, 	
		{
			//par8
			["to_c03_m02_brief_001_br_briefing_PARIAH_8", "PARIAH", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;
		} 
	],
*/
	/*
	[ 
		2,     
		{
		} 
	],
	[ 
		6,     
		{

			[markerSize "BIS_zoom1", markerpos "BIS_zoom1", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		13,     
		{
			_arrayTemp = ["BIS_surround_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		18,     
		{
		} 
	],
	[ 
		21,     
		{
		} 
	],
	[ 
		27, 	
		{
			[markerSize "BIS_zoom2", markerpos "BIS_zoom2", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		37, 	
		{
			_arrayTemp = ["BIS_firstArrows_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		44, 	
		{
		} 
	],
	[ 
		49, 	
		{
			[markerSize "BIS_zoom3", markerpos "BIS_zoom3", 2, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	[ 
		56, 	
		{
		} 
	],
	[ 
		66, 	
		{
			_arrayTemp = ["BIS_secondArrows_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 3, true] spawn BIS_fnc_showMarkerArray;
		} 
	],
	[ 
		77, 	
		{
		} 
	],
	[ 
		80, 	
		{
			[markerSize "BIS_zoom0", markerpos "BIS_zoom0", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		} 
	],
	*/

	[ 86.255,	{} ]
];