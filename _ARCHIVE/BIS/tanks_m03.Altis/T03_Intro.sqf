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

		0 = [true, [localize "STR_A3_Tanks_M03_intro_01_01", localize "STR_A3_Tanks_M03_intro_01_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M03_Intro_01_01"; sleep 3; playSound "M03_Intro_01_02"};
	}],

	[9.000,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[12.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[12.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		[MODE_SKYBOX_CREATE,T03_SLIDE1_ID_SKY,T03_SLIDE1_IMG_SKY,nil,60] call bis_fnc_animatedScreen;
		[MODE_SKYBOX_CREATE,T03_SLIDE1_ID_SKY_BLUR,T03_SLIDE1_IMG_SKY_BLUR,nil,60] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE1_ID_SMOKE,T03_SLIDE1_IMG_SMOKE,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE1_ID_SMOKE_BLUR,T03_SLIDE1_IMG_SMOKE_BLUR,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE1_ID_BACKGROUND,T03_SLIDE1_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE1_ID_BACKGROUND_BLUR,T03_SLIDE1_IMG_BACKGROUND_BLUR,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE1_ID_SIGN_BLUR,T03_SLIDE1_IMG_SIGN_BLUR,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE1_ID_SIGN,T03_SLIDE1_IMG_SIGN,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T03_SLIDE1_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T03_SLIDE1_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE1_ID_BACKGROUND_BLUR,8,nil,1.1] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T03_SLIDE1_ID_SIGN,8,[0.6,0.6],1.35] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE1_ID_SIGN_BLUR,8,[0.6,0.6],1.35] call bis_fnc_animatedScreen;

		[MODE_LAYER_FADE,T03_SLIDE1_ID_SKY_BLUR,5,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T03_SLIDE1_ID_SMOKE_BLUR,5,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T03_SLIDE1_ID_BACKGROUND_BLUR,5,0,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_FADE,T03_SLIDE1_ID_SIGN,5,0,1] call bis_fnc_animatedScreen;
	}],

	// Second slides
	[17.500,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[20.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[21.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M03_intro_02_01", localize "STR_A3_Tanks_M03_intro_02_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M03_Intro_02_01"; sleep 3; playSound "M03_Intro_02_02"};
	}],

	[29.000,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[32.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[32.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		// [MODE_SKYBOX_CREATE,T03_SLIDE2_ID_SKY,T03_SLIDE2_IMG_SKY,nil,60] call bis_fnc_animatedScreen; - seems bugged
		[MODE_SKYBOX_CREATE,T01_SLIDE6_ID_BACKGROUND,T01_SLIDE6_IMG_BACKGROUND,nil,60] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE2_ID_SUN,T03_SLIDE2_IMG_SUN,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE2_ID_BACKGROUND,T03_SLIDE2_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE2_ID_TANK,T03_SLIDE2_IMG_TANK,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE2_ID_CREWS,T03_SLIDE2_IMG_CREWS,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE2_ID_FOREGROUND,T03_SLIDE2_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T03_SLIDE2_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T03_SLIDE2_ID_SUN,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE2_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE2_ID_TANK,8,nil,1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE2_ID_CREWS,8,nil,1.25] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE2_ID_FOREGROUND,8,nil,1.35] call bis_fnc_animatedScreen;
	}],

	// Third slides
	[37.500,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[40.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[41.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M03_intro_03_01", localize "STR_A3_Tanks_M03_intro_03_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M03_Intro_03_01"; sleep 4; playSound "M03_Intro_03_02"};
	}],

	[48.000,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[51.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[51.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE3_ID_BACKGROUND,T03_SLIDE3_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE3_ID_MIDDLE,T03_SLIDE3_IMG_MIDDLE,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE3_ID_FOREGROUND,T03_SLIDE3_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T03_SLIDE3_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T03_SLIDE3_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE3_ID_MIDDLE,8,nil,1.15] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE3_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;
	}],

	// Fourth slides
	[56.500,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[59.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[60.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M03_intro_04"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
		playSound "M03_Intro_04";
	}],

	[66.000,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[69.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[69.500,{
		9 fadeMusic 0.05;
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE4_ID_BACKGROUND,T03_SLIDE4_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE4_ID_TANK,T03_SLIDE4_IMG_TANK,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE4_ID_CREW_1,T03_SLIDE4_IMG_CREW_1,nil,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T03_SLIDE4_ID_CREW_2,T03_SLIDE4_IMG_CREW_2,nil,nil,1] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T03_SLIDE4_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T03_SLIDE4_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE4_ID_TANK,8,nil,1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE4_ID_CREW_1,8,nil,1.25] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T03_SLIDE4_ID_CREW_2,8,nil,1.25] call bis_fnc_animatedScreen;
	}],

	[74.500,{
                [MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	// ENDING
	[77.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

 	[81.000,{
                // endMission "END1";
	}]
];
