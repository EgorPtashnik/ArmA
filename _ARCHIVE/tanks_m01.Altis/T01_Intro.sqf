private _timeline =
[
	// BOHEMIA PRESENTS
	[0.000,{
		0 fadeMusic 1;
		[MODE_BLACKOUT,0,false] call bis_fnc_animatedScreen;
	}],

	[2.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		0 = [true, [localize "STR_A3_Tanks_M01_intro_BIS", localize "STR_A3_Tanks_M01_intro_presents"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText; 
	}],
	// First slides
	[7.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[10.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[10.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_01"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText; 
		playSound "M01_Intro_01";
	}],

	[15.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[18.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[19.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE1_ID_BACKGROUND,T01_SLIDE1_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE1_ID_FOREGROUND,T01_SLIDE1_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		// [MODE_LAYER_ROTATE,T01_SLIDE1_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T01_SLIDE1_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE1_ID_FOREGROUND,8,nil,1.2] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T01_SLIDE1_ID_FOREGROUND,8,3] call bis_fnc_animatedScreen;

	}],

	// Second slides
	[24.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[27.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[27.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_02_01", localize "STR_A3_Tanks_M01_intro_02_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText; 
		0 = [] spawn {playSound "M01_Intro_02_01"; sleep 4; playSound "M01_Intro_02_02"};
	}],

	[34.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[37.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[38.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE2_ID_BACKGROUND,T01_SLIDE2_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE2_ID_FOREGROUND,T01_SLIDE2_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T01_SLIDE2_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T01_SLIDE2_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE2_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;
	}],

	// Third slides
	[43.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[46.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[46.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_03_01", localize "STR_A3_Tanks_M01_intro_03_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText; 
		0 = [] spawn {playSound "M01_Intro_03_01"; sleep 4; playSound "M01_Intro_03_02"};
	}],

	[54.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[57.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[58.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE3_ID_BACKGROUND,T01_SLIDE3_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE3_ID_FOREGROUND,T01_SLIDE3_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T01_SLIDE3_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE3_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE3_ID_FOREGROUND,8,nil,1.15] call bis_fnc_animatedScreen;

	}],

	// Fourth slides
	[63.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[66.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[66.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_04_01", localize "STR_A3_Tanks_M01_intro_04_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText; 
		0 = [] spawn {playSound "M01_Intro_04_01"; sleep 6; playSound "M01_Intro_04_02"};
	}],

	[77.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[80.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[81.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE4_ID_BW,T01_SLIDE4_IMG_BW,nil,nil,1.5] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE4_ID_COLOR,T01_SLIDE4_IMG_COLOR,nil,nil,1.5] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T01_SLIDE4_ID_BW,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE4_ID_COLOR,8,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T01_SLIDE4_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T01_SLIDE4_ID_COLOR,5,0,1] call bis_fnc_animatedScreen;
	}],

	// Fifth slides
	[86.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[89.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[89.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_05_01", localize "STR_A3_Tanks_M01_intro_05_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText; 
		0 = [] spawn {playSound "M01_Intro_05_01"; sleep 6; playSound "M01_Intro_05_02"};
	}],

	[101.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[104.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[105.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE5_ID_BACKGROUND_BLUR,T01_SLIDE5_IMG_BACKGROUND_BLUR,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE5_ID_BACKGROUND,T01_SLIDE5_IMG_BACKGROUND,nil,nil,1.1] call bis_fnc_animatedScreen;

		[MODE_LAYER_CREATE,T01_SLIDE5_ID_MIDDLE_BLUR,T01_SLIDE5_IMG_MIDDLE_BLUR,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE5_ID_MIDDLE,T01_SLIDE5_IMG_MIDDLE,nil,nil,1.1] call bis_fnc_animatedScreen;

		[MODE_LAYER_CREATE,T01_SLIDE5_ID_FOREGROUND,T01_SLIDE5_IMG_FOREGROUND,nil,nil,1.3] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE5_ID_FOREGROUND_BLUR,T01_SLIDE5_IMG_FOREGROUND_BLUR,nil,nil,1.3] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T01_SLIDE5_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T01_SLIDE5_ID_BACKGROUND_BLUR,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE5_ID_BACKGROUND,8,nil,1] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T01_SLIDE5_ID_MIDDLE_BLUR,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE5_ID_MIDDLE,8,nil,1] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T01_SLIDE5_ID_FOREGROUND_BLUR,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE5_ID_FOREGROUND,8,nil,1.1] call bis_fnc_animatedScreen;

		[MODE_LAYER_FADE,T01_SLIDE5_ID_BACKGROUND,7,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T01_SLIDE5_ID_MIDDLE,7,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T01_SLIDE5_ID_FOREGROUND_BLUR,7,0,1] call bis_fnc_animatedScreen;
	}],

	// Sixth slides
	[110.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[113.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[113.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_06_01", localize "STR_A3_Tanks_M01_intro_06_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText; 
		0 = [] spawn {playSound "M01_Intro_06_01"; sleep 4; playSound "M01_Intro_06_02"};
	}],

	[122.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[125.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[126.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_SKYBOX_CREATE,T01_SLIDE6_ID_BACKGROUND,T01_SLIDE6_IMG_BACKGROUND,nil,60] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE6_ID_MIDDLE,T01_SLIDE6_IMG_MIDDLE,nil,nil,1.125] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T01_SLIDE6_ID_FOREGROUND,T01_SLIDE6_IMG_FOREGROUND,nil,nil,1.35] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T01_SLIDE6_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;
		// [MODE_LAYER_ANIMATE,T01_SLIDE6_ID_BACKGROUND,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE6_ID_MIDDLE,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T01_SLIDE6_ID_FOREGROUND,8,nil,1.15] call bis_fnc_animatedScreen;
	}],

	// CAMPAIGN NAME
	[131.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[134.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[140.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M01_intro_Altis", localize "STR_A3_Tanks_M01_intro_Requiem"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
	}],

	[145.000,{
		9 fadeMusic 0.05;
		[MODE_BLACKOUT,5,false] call bis_fnc_animatedScreen;
	}],

	// ENDING
	[154.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],
 	[154.500,{
		// endMission "END1";
	}]
];
