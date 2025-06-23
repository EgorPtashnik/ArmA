private _timeline =
[

	[ 0.000, 	{
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
				0 = [true, [localize "STR_A3_TO_C03_Opening_text01a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
    			}
	],
	[ 4.7, 		{	[MODE_BLACKOUT,3,false] call bis_fnc_animatedScreen;	}],
	[ 7.741101, 	{//2
				// < Image 01 -
				playsound3D ["a3\Sounds_F_Tacops\SFX\Missions\c03_1.wss",player, false, getPosASL player, 1.0];
    				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
       				[MODE_BLACKOUT,	0.01, true								] call bis_fnc_animatedScreen;

				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_DUST, 		C03_SLIDE1_IMG_DUST,	nil, nil, 1.3		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_OBSTACLE, 	C03_SLIDE1_IMG_OBSTACLE, [0.46,0.45], nil, 1.2		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_SOLDIER1, 	C03_SLIDE1_IMG_SOLDIER1		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_SOLDIER2, 	C03_SLIDE1_IMG_SOLDIER2		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_HELICOPTER, 	C03_SLIDE1_IMG_HELICOPTER	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_SMOKEMASK1, 	C03_SLIDE1_IMG_SMOKEMASK1	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_SMOKEMASK2, 	C03_SLIDE1_IMG_SMOKEMASK2	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_BGROUNDCLOUDS, 	C03_SLIDE1_IMG_BGROUNDCLOUDS	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_SET, 		C03_SLIDE1_IMG_SET		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE1_ID_SMOKE, 		C03_SLIDE1_IMG_SMOKE		] call bis_fnc_animatedScreen;

//				[MODE_LAYER_ROTATE, 	C03_SLIDE1_ID_SOLDIER2, 	8,5				] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_SOLDIER2,
								C03_SLIDE1_ID_SMOKEMASK1,
								C03_SLIDE1_ID_SMOKEMASK2,
								C03_SLIDE1_ID_BGROUNDCLOUDS,
								C03_SLIDE1_ID_SET
							],			 	8,nil,1.1			] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_OBSTACLE
        						],			 	8,[0.50,0.46],1.4			] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_SOLDIER1
			        			],			 	8,[0.48,0.50],1.2			] call bis_fnc_animatedScreen;
    				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_SOLDIER2
			        			],			 	8,[0.51,0.50],1.15			] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_DUST
			        			],			 	8,[0.50,0.47],1.0			] call bis_fnc_animatedScreen;
				[MODE_LAYER_ROTATE, 		C03_SLIDE1_ID_DUST, 	8,20					] call bis_fnc_animatedScreen;

				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_SMOKE
			        			],			 	8,[0.75,0.35],1.0			] call bis_fnc_animatedScreen;

				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE1_ID_HELICOPTER
			        			],			 	8,[0.55,0.55],1.3			] call bis_fnc_animatedScreen;

				[MODE_BLACKIN,		2,				false					] call bis_fnc_animatedScreen;
			}
	],
	[9.329725, 	{
    				//0 = [localize "STR_A3_TO_C03_Opening_text02a", STYLE_DYNAMIC_TOPLEFT, 0] spawn BIS_fnc_TO_AS_ShowDynamicText;
       			}
	],
	[11.120371, 	{
				//0 = [localize "STR_A3_TO_C03_Opening_text02b", STYLE_DYNAMIC_CENTER1, 1] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[13.388523, 	{
				//  Image 01 >
				//fade to black
				[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen;			}
	],
	[ 15.390373, 	{//6
				// < Text 01
    				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
       				0 = [true, [localize "STR_A3_TO_C03_Opening_text03a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
    			}
	],
	[ 21.230634,  	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen;	}],
	[ 23.090151, 	{//8
				// < Image 02 -
				playsound3D ["a3\Sounds_F_Tacops\SFX\Missions\c03_2.wss",player, false, getPosASL player, 0.65];
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
       				[MODE_BLACKOUT,	0.01, true								] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE2_ID_TOWERLIGHT, 	C03_SLIDE2_IMG_TOWERLIGHT	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE2_ID_FOREGROUND, 	C03_SLIDE2_IMG_FOREGROUND	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE2_ID_CABIN, 		C03_SLIDE2_IMG_CABIN,nil,0	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE2_ID_CARLIGHT, 	C03_SLIDE2_IMG_CARLIGHT,nil,0	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE2_ID_CARRIER, 		C03_SLIDE2_IMG_CARRIER		] call bis_fnc_animatedScreen;
				[MODE_SKYBOX_CREATE, 	C03_SLIDE2_ID_CLOUDS, 		C03_SLIDE2_IMG_CLOUDS,nil, 45	] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE2_ID_BACKGROUND, 	C03_SLIDE2_IMG_BACKGROUND	] call bis_fnc_animatedScreen;

				[MODE_LAYER_PULSE,	C03_SLIDE2_ID_TOWERLIGHT,       0.9,0.1,1.5                     ] call bis_fnc_animatedScreen;

				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE2_ID_BACKGROUND,
								C03_SLIDE2_ID_CARRIER,
								C03_SLIDE2_ID_TOWERLIGHT,
								C03_SLIDE2_ID_CABIN,
								C03_SLIDE2_ID_CARLIGHT
							],			 	9,nil, 1.2				] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE2_ID_FOREGROUND
							],			 	9,[0.1,0.55], 1.4				] call bis_fnc_animatedScreen;

				[MODE_LAYER_ROTATE, 	[
								C03_SLIDE2_ID_BACKGROUND,
								C03_SLIDE2_ID_CARRIER,
								C03_SLIDE2_ID_TOWERLIGHT,
								C03_SLIDE2_ID_CABIN,
								C03_SLIDE2_ID_CARLIGHT
							],			 	9,-3				] call bis_fnc_animatedScreen;

				[MODE_LAYER_ROTATE, 	[
								C03_SLIDE2_ID_FOREGROUND
        						],			 	9,-15				] call bis_fnc_animatedScreen;
				//[MODE_LAYER_ANIMATE, 	C03_SLIDE2_ID_CARRIER, 	8,nil,1.1			] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,		2,				false				] call bis_fnc_animatedScreen;
			}
	],
   	[ 24.69,		{
       				[MODE_LAYER_FADE, 	C03_SLIDE2_ID_CABIN, 		0.7,1,0  	                ] call bis_fnc_animatedScreen;
			}
	],
	[ 25.105776, {
   				 //0 = [localize "STR_A3_TO_C03_Opening_text04a", 999, 0,[0.5,0.45]] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
 	[ 26.49,	{
				[MODE_LAYER_FADE, 	C03_SLIDE2_ID_CARLIGHT,       	0.2,1,0.3                     	] call bis_fnc_animatedScreen;
    			}
	],
	[ 26.6,		{
       				[MODE_LAYER_FADE, 	C03_SLIDE2_ID_CARLIGHT, 	0.5,1,0  	                ] call bis_fnc_animatedScreen;
			}
	],
	[ 26.979067, 	{
    				 //0 = [localize "STR_A3_TO_C03_Opening_text04b", 999, 1,[0.15,0.75]] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],

	[ 28.675478, 	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen; }],
	[ 30.780746, 	{
				// < Text 02
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
       				0 = [true, [localize "STR_A3_TO_C03_Opening_text05a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
    			}
	],
	[ 36.014942, 	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen; }],
	[ 38.457567, 	{//17
				// < Image 03 -
				playsound3D ["a3\Sounds_F_Tacops\SFX\Missions\c03_4.wss",player, false, getPosASL player, 0.45];
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
       				[ MODE_BLACKOUT,	0.01, true							] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE4_ID_BACKGROUND, 	C03_SLIDE4_IMG_BACKGROUND	] call bis_fnc_animatedScreen;
				//[MODE_LAYER_ROTATE, 	C03_SLIDE4_ID_BACKGROUND, 	8,5				] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	C03_SLIDE4_ID_BACKGROUND, 	8,nil,1.1			] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,		2,				false				] call bis_fnc_animatedScreen;
        		}
	],
	[ 40.349224,	{
    				//0 = [localize "STR_A3_TO_C03_Opening_text06a", STYLE_DYNAMIC_TOPLEFT] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[ 42.351075, 	{
    				//0 = [localize "STR_A3_TO_C03_Opening_text06b", STYLE_DYNAMIC_BOTTOMRIGHT] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[ 44.155495,  	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen; }],
	[ 46.152754, 	{
				// < Text 03
    				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
       				0 = [true, [localize "STR_A3_TO_C03_Opening_text07a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
    			}
	],
	[ 51.827724,  	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen; }],
	[ 53.829575, 	{//23
				// < Image 04 -
				playsound3D ["a3\Sounds_F_Tacops\SFX\Missions\c03_3.wss",player, false, getPosASL player, 0.73];
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
     				[MODE_SKYBOX_CREATE, 	C03_SLIDE3_ID_CLOUDS, 		C03_SLIDE3_IMG_CLOUDS,0.7,40		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE3_ID_BACKGROUND, 	C03_SLIDE3_IMG_BACKGROUND		] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE3_ID_CARRIER, 		C03_SLIDE3_IMG_CARRIER			] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE3_ID_COCKPIT, 		C03_SLIDE3_IMG_COCKPIT			] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE3_ID_MONITORS, 	C03_SLIDE3_IMG_MONITORS			] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE3_ID_MONITORS_BLUR, 	C03_SLIDE3_IMG_MONITORS_BLUR,nil,0	] call bis_fnc_animatedScreen;

				[MODE_LAYER_ANIMATE, 	[
        							C03_SLIDE3_ID_CARRIER,
								C03_SLIDE3_ID_BACKGROUND
							], 	8,[0.51,0.53],1.1							] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	[
								C03_SLIDE3_ID_MONITORS,
								C03_SLIDE3_ID_MONITORS_BLUR
							], 	8,[0.51,0.49],1.3							] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	C03_SLIDE3_ID_COCKPIT, 		8,[0.53,0.485],1.2				] call bis_fnc_animatedScreen;
				[MODE_LAYER_ROTATE,     [
								C03_SLIDE3_ID_CARRIER,
								C03_SLIDE3_ID_BACKGROUND
							], 	8,5									] call bis_fnc_animatedScreen;
				[MODE_LAYER_ROTATE,     [
								C03_SLIDE3_ID_MONITORS,
								C03_SLIDE3_ID_MONITORS_BLUR,
								C03_SLIDE3_ID_COCKPIT
							], 	8,-3									] call bis_fnc_animatedScreen;

				[MODE_BLACKIN,		2,				false						] call bis_fnc_animatedScreen;
				uisleep 1;
				[MODE_LAYER_FADE,	C03_SLIDE3_ID_MONITORS_BLUR,	2,1						] call bis_fnc_animatedScreen;

				/*
				[MODE_LAYER_ROTATE, 	C03_SLIDE3_ID_BACKGROUND, 	8,5				] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	C03_SLIDE3_ID_BACKGROUND, 	8,nil,1.1			] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,		2,				false				] call bis_fnc_animatedScreen;
				*/
			}
	],
	[ 55.757963, 	{
    				//0 = [localize "STR_A3_TO_C03_Opening_text08a", STYLE_DYNAMIC_TOPLEFT] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[ 57.723082, 	{
    				//0 = [localize "STR_A3_TO_C03_Opening_text08b", STYLE_DYNAMIC_BOTTOMRIGHT] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[ 59.504545, 		{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen;	}],
 	[ 61.488030, 	{
				// < Text 04
    				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
       				0 = [true, [localize "STR_A3_TO_C03_Opening_text09a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
    			}
	],
	[ 67.165000, 		{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen;	}],
	[ 69.164851, 	{       //key 29
				// < Image 05 -
				playsound3D ["a3\Sounds_F_Tacops\SFX\Missions\c03_5.wss",player, false, getPosASL player, 0.15];
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
       				[MODE_BLACKOUT,	0.01, true								] call bis_fnc_animatedScreen;
				[MODE_LAYER_CREATE, 	C03_SLIDE5_ID_BACKGROUND, 	C03_SLIDE5_IMG_BACKGROUND	] call bis_fnc_animatedScreen;
				[MODE_LAYER_ROTATE, 	C03_SLIDE5_ID_BACKGROUND, 	10,2				] call bis_fnc_animatedScreen;
				[MODE_LAYER_ANIMATE, 	C03_SLIDE5_ID_BACKGROUND, 	10,nil,1.05			] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,		2,				false				] call bis_fnc_animatedScreen;
			}
	],
	[ 71.515648, 	{
				//0 = [localize "STR_A3_TO_C03_Opening_text08a", STYLE_DYNAMIC_TOPLEFT, 0] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[ 74.747994, 	{
   				//0 = [localize "STR_A3_TO_C03_Opening_text08b", STYLE_DYNAMIC_BOTTOMRIGHT, 1] spawn BIS_fnc_TO_AS_ShowDynamicText;
			}
	],
	[ 78.053802, 	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen;	}],
	[ 80.735179,	{
    				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
	  			0 = [true, [ localize "str_a3_to_c03_briefingnameA", localize "str_a3_to_c03_briefingnameB"], STYLE_TITLE_BIG] spawn BIS_fnc_TO_AS_ShowStaticText;
			}
	],
	[ 87.310064,	{	[MODE_BLACKOUT,2,false] call bis_fnc_animatedScreen;	}],
	[ 88.191613,    {}],
	[ 92.342239,	{} ]
];