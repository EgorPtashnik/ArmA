private _timeline2 =
[
	// First slides
	[0.000,{
		0 fadeMusic 0;
		7.5 fadeMusic 0.5;
		[MODE_BLACKOUT,0,false] call bis_fnc_animatedScreen;

		// If variables do not exist, create them and set to 0
		if (isNil {profileNamespace getVariable "BIS_Tanks_Victory"}) then {profileNamespace setVariable ["BIS_Tanks_Victory",0]};
		if (isNil {profileNamespace getVariable "BIS_Tanks_ArmataKO"}) then {profileNamespace setVariable ["BIS_Tanks_ArmataKO",0]};
		if (isNil {profileNamespace getVariable "BIS_Tanks_LimitedDamage"}) then {profileNamespace setVariable ["BIS_Tanks_LimitedDamage",0]};
	}],

	[2.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_Victory") == 1) then {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_01", localize "STR_A3_Tanks_M03_outro_01A"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
			0 = [] spawn {playSound "M03_Outro_01"; sleep 4; playSound "M03_Outro_01a"};
		} else {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_01", localize "STR_A3_Tanks_M03_outro_01B"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
			0 = [] spawn {playSound "M03_Outro_01"; sleep 5; playSound "M03_Outro_01b"};
		};
	}],

	[10.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[13.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[13.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_Victory") == 1) then {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1A_ID_BACKGROUND_BLUR,T_OUTRO_SLIDE1A_IMG_BACKGROUND_BLUR,nil,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1A_ID_BACKGROUND,T_OUTRO_SLIDE1A_IMG_BACKGROUND,nil,nil,1.1] call bis_fnc_animatedScreen;
			// [MODE_LAYER_CREATE,T_OUTRO_SLIDE1A_ID_SMOKE_BACK,T_OUTRO_SLIDE1A_IMG_SMOKE_BACK,nil,nil,1.15] call bis_fnc_animatedScreen;
			// [MODE_LAYER_CREATE,T_OUTRO_SLIDE1A_ID_SMOKE_FRONT,T_OUTRO_SLIDE1A_IMG_SMOKE_FRONT,nil,nil,1.15] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1A_ID_FOREGROUND,T_OUTRO_SLIDE1A_IMG_FOREGROUND,nil,nil,1.25] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1A_ID_FOREGROUND_BLUR,T_OUTRO_SLIDE1A_IMG_FOREGROUND_BLUR,nil,nil,1.25] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE1A_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1A_ID_BACKGROUND_BLUR,8,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1A_ID_BACKGROUND,8,nil,1] call bis_fnc_animatedScreen;
			// [MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1A_ID_SMOKE_BACK,8,nil,1] call bis_fnc_animatedScreen;
			// [MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1A_ID_SMOKE_FRONT,8,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1A_ID_FOREGROUND,8,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1A_ID_FOREGROUND_BLUR,8,nil,1] call bis_fnc_animatedScreen;

			[MODE_LAYER_FADE,T_OUTRO_SLIDE1A_ID_BACKGROUND,7,0,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_FADE,T_OUTRO_SLIDE1A_ID_FOREGROUND_BLUR,7,0,1] call bis_fnc_animatedScreen;

		} else {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1B_ID_BACKGROUND_BLUR,T_OUTRO_SLIDE1B_IMG_BACKGROUND_BLUR,nil,nil,1.05] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1B_ID_BACKGROUND,T_OUTRO_SLIDE1B_IMG_BACKGROUND,nil,nil,1.05] call bis_fnc_animatedScreen;
			// [MODE_LAYER_CREATE,T_OUTRO_SLIDE1B_ID_SMOKE,T_OUTRO_SLIDE1B_IMG_SMOKE,nil,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1B_ID_FOREGROUND,T_OUTRO_SLIDE1B_IMG_FOREGROUND,nil,nil,1.2] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE1B_ID_FOREGROUND_BLUR,T_OUTRO_SLIDE1B_IMG_FOREGROUND_BLUR,nil,nil,1.2] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE1B_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1B_ID_BACKGROUND_BLUR,8,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1B_ID_BACKGROUND,8,nil,1] call bis_fnc_animatedScreen;
			// [MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1B_ID_SMOKE,8,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1B_ID_FOREGROUND,8,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE1B_ID_FOREGROUND_BLUR,8,nil,1] call bis_fnc_animatedScreen;

			[MODE_LAYER_FADE,T_OUTRO_SLIDE1B_ID_BACKGROUND,7,0,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_FADE,T_OUTRO_SLIDE1B_ID_FOREGROUND_BLUR,7,0,1] call bis_fnc_animatedScreen;
		};
	}],

	// Second slides
	[18.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[21.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[22.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M03_outro_02_01", localize "STR_A3_Tanks_M03_outro_02_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
		0 = [] spawn {playSound "M03_Outro_02_01"; sleep 3; playSound "M03_Outro_02_02"};
	}],

	[30.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[33.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[33.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T_OUTRO_SLIDE2_ID_BACKGROUND,T_OUTRO_SLIDE2_IMG_BACKGROUND,nil,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T_OUTRO_SLIDE2_ID_DUST,T_OUTRO_SLIDE2_IMG_DUST,nil,nil,1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T_OUTRO_SLIDE2_ID_FOREGROUND,T_OUTRO_SLIDE2_IMG_FOREGROUND,nil,nil,1.3] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE2_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE2_ID_BACKGROUND,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE2_ID_DUST,8,nil,1.05] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE2_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;
	}],

	// Third slides
	[38.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[41.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[42.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_ArmataKO") == 1) then {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_03A"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
			playSound "M03_Outro_03A";
		} else {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_03B"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
			playSound "M03_Outro_03B";
		};
	}],

	[48.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[51.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[51.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_ArmataKO") == 1) then {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE3A_ID_BACKGROUND,T_OUTRO_SLIDE3A_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE3A_ID_FOREGROUND,T_OUTRO_SLIDE3A_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE3A_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE3A_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE3A_ID_FOREGROUND,8,nil,1.2] call bis_fnc_animatedScreen;

		} else {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE3B_ID_BACKGROUND,T_OUTRO_SLIDE3B_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE3B_ID_FOREGROUND,T_OUTRO_SLIDE3B_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE3B_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE3B_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE3B_ID_FOREGROUND,8,nil,1.2] call bis_fnc_animatedScreen;
		};
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

		0 = [true, [localize "STR_A3_Tanks_M03_outro_04"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
		playSound "M03_Outro_04";
	}],

	[66.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[69.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[69.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		// original sky seems bugged, used one from intro 01
		[MODE_SKYBOX_CREATE,T01_SLIDE6_ID_BACKGROUND,T01_SLIDE6_IMG_BACKGROUND,nil,60] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T_OUTRO_SLIDE4_ID_BACKGROUND,T_OUTRO_SLIDE4_IMG_BACKGROUND,nil,nil,1.2] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T_OUTRO_SLIDE4_ID_MIDDLE,T_OUTRO_SLIDE4_IMG_MIDDLE,nil,nil,1.3] call bis_fnc_animatedScreen;
		[MODE_LAYER_CREATE,T_OUTRO_SLIDE4_ID_FOREGROUND,T_OUTRO_SLIDE4_IMG_FOREGROUND,nil,nil,1.4] call bis_fnc_animatedScreen;

		// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE4_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

		[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE4_ID_BACKGROUND,8,nil,1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE4_ID_MIDDLE,8,nil,1.1] call bis_fnc_animatedScreen;
		[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE4_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;
	}],

	// Fifth slides
	[74.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[77.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[78.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_LimitedDamage") == 1) then {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_05", localize "STR_A3_Tanks_M03_outro_05A"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
			0 = [] spawn {playSound "M03_Outro_05"; sleep 6; playSound "M03_Outro_05A"};
		} else {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_05", localize "STR_A3_Tanks_M03_outro_05B"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
			0 = [] spawn {playSound "M03_Outro_05"; sleep 6; playSound "M03_Outro_05B"};
		};
	}],

	[87.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[90.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[90.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_LimitedDamage") == 1) then {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE5A_ID_BACKGROUND,T_OUTRO_SLIDE5A_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE5A_ID_FOREGROUND,T_OUTRO_SLIDE5A_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE5A_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE5A_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE5A_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;
		} else {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE5B_ID_BACKGROUND,T_OUTRO_SLIDE5B_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE5B_ID_MID2,T_OUTRO_SLIDE5B_IMG_MID2,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE5B_ID_MID1,T_OUTRO_SLIDE5B_IMG_MID1,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE5B_ID_FOREGROUND,T_OUTRO_SLIDE5B_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE5B_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE5B_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE5B_ID_MID2,8,nil,1.2] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE5B_ID_MID1,8,nil,1.2] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE5B_ID_FOREGROUND,8,nil,1.3] call bis_fnc_animatedScreen;
		};
	}],

	// Sixth slides
	[95.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[98.500,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[99.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_LimitedDamage") == 1) then {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_06A_01", localize "STR_A3_Tanks_M03_outro_06A_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
			0 = [] spawn {playSound "M03_Outro_06A_01"; sleep 4.5; playSound "M03_Outro_06A_02"};
			// Setting the BY THE BOOK achievement -----------------
			setStatValue ["TankByTheBook",1];
			// -----------------------------------------------------
		} else {
			0 = [true, [localize "STR_A3_Tanks_M03_outro_06B_01", localize "STR_A3_Tanks_M03_outro_06B_02"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
			0 = [] spawn {playSound "M03_Outro_06B_01"; sleep 5; playSound "M03_Outro_06B_02"};
		};
	}],

	[109.000,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[112.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[112.500,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;
		if ((profileNamespace getVariable "BIS_Tanks_LimitedDamage") == 1) then {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE6A_ID_BACKGROUND,T_OUTRO_SLIDE6A_IMG_BACKGROUND,nil,nil,1] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE6A_ID_FOREGROUND,T_OUTRO_SLIDE6A_IMG_FOREGROUND,nil,nil,1] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE6A_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE6A_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE6A_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;

		} else {
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE6B_ID_BACKGROUND,T_OUTRO_SLIDE6B_IMG_BACKGROUND,nil,nil,2] call bis_fnc_animatedScreen;
			[MODE_LAYER_CREATE,T_OUTRO_SLIDE6B_ID_FOREGROUND,T_OUTRO_SLIDE6B_IMG_FOREGROUND,nil,nil,2.75] call bis_fnc_animatedScreen;

			// [MODE_LAYER_ROTATE,T_OUTRO_SLIDE6B_ID_BACKGROUND,8,3] call bis_fnc_animatedScreen;

			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE6B_ID_BACKGROUND,8,nil,1.1] call bis_fnc_animatedScreen;
			[MODE_LAYER_ANIMATE,T_OUTRO_SLIDE6B_ID_FOREGROUND,8,nil,1.25] call bis_fnc_animatedScreen;
		};
	}],

	// ENDING
	[117.500,{
		[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
	}],

	[120.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

	[125.000,{
		[MODE_BLACKIN,0.01,false] call bis_fnc_animatedScreen;

		0 = [true, [localize "STR_A3_Tanks_M03_outro_TheEnd"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
	}],

	[130.000,{
		6 fadeMusic 0.05;
		[MODE_BLACKOUT,3,false] call bis_fnc_animatedScreen;
	}],

 	[134.000,{
		[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	}],

 	[138.000,{
		// endMission "END1";
	}]
];
