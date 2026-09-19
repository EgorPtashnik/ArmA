private _timeline =
[
	// First slides
	[0.000,{
		0 fadeMusic 0;
		5 fadeMusic 0.5;
		[MODE_BLACKOUT,0,false] call bis_fnc_animatedScreen;
	}],

	[2.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M02_intro_01_01", localize "STR_A3_Tanks_M02_intro_01_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M02_Intro_01_01"; sleep 6; playSound "M02_Intro_01_02"};
	}],

	[12.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[15.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[15.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_SKYBOX_CREATE,T02_SLIDE1_ID_BACKGROUND_BLUR,T02_SLIDE1_IMG_BACKGROUND_BLUR,nil,60] call bis_fnc_animatedScreen;
		[MODE_SKYBOX_CREATE,T02_SLIDE1_ID_BACKGROUND,T02_SLIDE1_IMG_BACKGROUND,nil,60] call bis_fnc_animatedScreen;

		[MODE_LAYER_CREATE,T02_SLIDE1_ID_MIDDLE_BLUR,T02_SLIDE1_IMG_MIDDLE_BLUR,nil,nil,1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE1_ID_MIDDLE,T02_SLIDE1_IMG_MIDDLE,nil,nil,1.2] call bis_fnc_animatedScreen;

		[MODE_LAYER_CREATE,T02_SLIDE1_ID_AAF,T02_SLIDE1_IMG_AAF,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE1_ID_AAF_BLUR,T02_SLIDE1_IMG_AAF_BLUR,nil,nil,1.1] call bis_fnc_animatedScreen;

		[MODE_LAYER_CREATE,T02_SLIDE1_ID_CSAT,T02_SLIDE1_IMG_CSAT,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE1_ID_CSAT_BLUR,T02_SLIDE1_IMG_CSAT_BLUR,nil,nil,1.1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T02_SLIDE1_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T02_SLIDE1_ID_MIDDLE_BLUR,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE1_ID_MIDDLE,8,nil,1] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T02_SLIDE1_ID_AAF_BLUR,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE1_ID_AAF,8,nil,1] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T02_SLIDE1_ID_CSAT_BLUR,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE1_ID_CSAT,8,nil,1] call bis_fnc_animatedScreen;

		[MODE_LAYER_FADE,T02_SLIDE1_ID_BACKGROUND,7,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T02_SLIDE1_ID_MIDDLE,7,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T02_SLIDE1_ID_AAF_BLUR,7,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T02_SLIDE1_ID_CSAT_BLUR,7,0,1] call bis_fnc_animatedScreen;
	}],

	// Second slides
	[20.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[23.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[24.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M02_intro_02_01", localize "STR_A3_Tanks_M02_intro_02_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M02_Intro_02_01"; sleep 6; playSound "M02_Intro_02_02"};
	}],

	[38.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[41.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[41.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE2_ID_SKY,T02_SLIDE2_IMG_SKY,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_SKYBOX_CREATE,T02_SLIDE2_ID_FOG,T02_SLIDE2_IMG_FOG,nil,60] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE2_ID_BACKGROUND,T02_SLIDE2_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE2_ID_KAMYSH,T02_SLIDE2_IMG_KAMYSH,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE2_ID_RIFLEMAN,T02_SLIDE2_IMG_RIFLEMAN,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE2_ID_HEAVYGUNNER,T02_SLIDE2_IMG_HEAVYGUNNER,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE2_ID_CLUTTER,T02_SLIDE2_IMG_CLUTTER,nil,nil,1.1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T02_SLIDE2_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ANIMATE,T02_SLIDE2_ID_SKY,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE2_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE2_ID_KAMYSH,8,[0.575,0.5],1.15] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE2_ID_RIFLEMAN,8,[0.625,0.5],1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE2_ID_HEAVYGUNNER,8,[0.725,0.5],1.25] call bis_fnc_animatedScreen;
		// [MODE_LAYER_ANIMATE,T02_SLIDE2_ID_FOG,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE2_ID_CLUTTER,8,nil,1.3] call bis_fnc_animatedScreen;
	}],

	// Third slides
	[46.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[49.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[50.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M02_intro_03_01", localize "STR_A3_Tanks_M02_intro_03_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M02_Intro_03_01"; sleep 6; playSound "M02_Intro_03_02"};
	}],

	[65.000,{
		[MODE_BLACKOUT,2.0,false] call bis_fnc_animatedScreen;
	}],

	[67.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[68.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE3_ID_BACKGROUND,T02_SLIDE3_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE3_ID_TANK,T02_SLIDE3_IMG_TANK,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE3_ID_INSTRUCTOR,T02_SLIDE3_IMG_INSTRUCTOR,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE3_ID_CREWS_2,T02_SLIDE3_IMG_CREWS_2,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE3_ID_CREWS_1,T02_SLIDE3_IMG_CREWS_1,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T02_SLIDE3_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T02_SLIDE3_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE3_ID_TANK,8,nil,1.15] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE3_ID_INSTRUCTOR,8,nil,1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE3_ID_CREWS_1,8,nil,1.25] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE3_ID_CREWS_2,8,nil,1.25] call bis_fnc_animatedScreen;
	}],

	// Fourth slides
	[73.000,{
		[MODE_BLACKOUT,2.0,false] call bis_fnc_animatedScreen;
	}],

	[75.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[76.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M02_intro_04"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
		playSound "M02_Intro_04";
	}],

	[83.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[86.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[86.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE4_ID_BACKGROUND,T02_SLIDE4_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE4_ID_AFTERBURNER,T02_SLIDE4_IMG_AFTERBURNER,nil,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE4_ID_PLANE_A,T02_SLIDE4_IMG_PLANE_A,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE4_ID_PLANE_B,T02_SLIDE4_IMG_PLANE_B,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T02_SLIDE4_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_FADE,T02_SLIDE4_ID_AFTERBURNER,5,1,0] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T02_SLIDE4_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE4_ID_PLANE_A,8,[0.375,0.5],1.15] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE4_ID_PLANE_B,8,[0.4,0.5],1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE4_ID_AFTERBURNER,8,[0.4,0.5],1.2] call bis_fnc_animatedScreen;
	}],

	// Fifth slides
	[91.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[94.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[95.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M02_intro_05_01", localize "STR_A3_Tanks_M02_intro_05_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M02_Intro_05_01"; sleep 5; playSound "M02_Intro_05_02"};
	}],

	[107.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[110.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[110.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE5_ID_BACKGROUND,T02_SLIDE5_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T02_SLIDE5_ID_FOG,T02_SLIDE5_IMG_FOG,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T02_SLIDE5_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T02_SLIDE5_ID_BACKGROUND,8,nil,1.05] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T02_SLIDE5_ID_FOG,8,nil,1.15] call bis_fnc_animatedScreen;
	}],

	[115.500,{
		6.5 fadeMusic 0.05;
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	// ENDING
	[118.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

 	[123.000,{
		// endMission "END1";
	}]
];
