/*
WIN BEST/NORMAL/BAD: ta_sf_counterattacked_neutralized
PARIAH: (relieved, exhausted) Guardian, it's over.
PARIAH: () All enemy reinforcements destroyed.
GUARDIAN: () Good going, Pariah, we're seeing it across the board, CSAT's frontlines are crumbling!



WIN BEST/NORMAL/BAD: ta_inf_second_town_captured
ALPHASPEAKER: (exhausted) Guardian, it's Alpha.
ALPHASPEAKER: (exhausted) All tasks complete - both towns are in our control.
ALPHASPEAKER: (exhausted) It was a helluva fight, sir, over.
GUARDIAN: () Excellent work, sergeant! We're getting reports from Le Trinité...
GUARDIAN: () CSAT's Scimitar Regiment just threw in the towel. Expect a full cessastion of hostilites within the hour! Out.



*/

private _timeline =
[

	[ 0.000, 	{
				0 fadeMusic 0.4;
      			}
	],
	[ 4.013107, 	{
				if(player == BIS_Pariah) then
				{
					["ta_sf_counterattacked_neutralized","to_c02_m02",["to_c02_m02_055_ta_sf_counterattacked_neutralized_PARIAH_0","to_c02_m02_055_ta_sf_counterattacked_neutralized_PARIAH_0"]] call BIS_fnc_kbTell;
				};
    			}
	],
	[ 8.233787, 	{
				if(player == BIS_Pariah) then
				{
					["ta_sf_counterattacked_neutralized","to_c02_m02",["to_c02_m02_055_ta_sf_counterattacked_neutralized_PARIAH_1","to_c02_m02_055_ta_sf_counterattacked_neutralized_PARIAH_1"]] call BIS_fnc_kbTell;
				};
			}
	],
	[ 13.319334, 	{
				if(player == BIS_Pariah) then
				{
					["ta_sf_counterattacked_neutralized","to_c02_m02",["to_c02_m02_055_ta_sf_counterattacked_neutralized_GUARDIAN_0","to_c02_m02_055_ta_sf_counterattacked_neutralized_GUARDIAN_0"]] call BIS_fnc_kbTell;
				};
    			}
	],
 	[ 22.452591, 	{
 				If(player == BIS_Pariah) then
 				{
				["ta_inf_second_town_captured","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_0","to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_0"],true] call BIS_fnc_kbTell;
				} else {
				["ta_inf_second_town_captured_dry","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_0_dry","to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_0_dry"]] call BIS_fnc_kbTell;
				};
    			}
	],
	[ 24.459140, 	{
				If(player == BIS_Pariah) then
 				{
    			["ta_inf_second_town_captured","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_1","to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_1"],true] call BIS_fnc_kbTell;
    			} else {
    			["ta_inf_second_town_captured_dry","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_1_dry","to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_1_dry"]] call BIS_fnc_kbTell;
    		};
			}
	],
	[ 27.806712, 	{
				If(player == BIS_Pariah) then
 				{
				["ta_inf_second_town_captured","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_2","to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_2"],true] call BIS_fnc_kbTell;
				} else {
				["ta_inf_second_town_captured_dry","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_2_dry","to_c02_m02_016_ta_inf_second_town_captured_ALPHASPEAKER_2_dry"]] call BIS_fnc_kbTell;
			};
			}
	],
	[ 31.102698, 	{
				["ta_inf_second_town_captured","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_GUARDIAN_0","to_c02_m02_016_ta_inf_second_town_captured_GUARDIAN_0"],true] call BIS_fnc_kbTell;
			}
	],
	[ 34.409720, 	{
				["ta_inf_second_town_captured","to_c02_m02",["to_c02_m02_016_ta_inf_second_town_captured_GUARDIAN_1","to_c02_m02_016_ta_inf_second_town_captured_GUARDIAN_1"],true] call BIS_fnc_kbTell;
			}
	],
	[ 41.345103, 	{ //9
				3 fadeMusic 1;
				titleCut ["", "BLACK", 3.5];
			}
	],
   	[ 46.081435, 	{
				enableEnvironment false;
				//setup new animated screen framework
				[MODE_INIT,[15,5,1],1.05] call bis_fnc_animatedScreen;
                                private _ctrlOverlay = [MODE_OVERLAY_CREATE,0," ",[0.5,0.95],ALIGN_BOTTOM,nil,1,2,1,"PuristaBold"] call bis_fnc_animatedScreen;
				//create black screen
				[MODE_BLACKOUT,0,false] call bis_fnc_animatedScreen;
    				//setup holdkey function to make the opening skippable (2nd parameter is key to be pressed)
				[[] call BIS_fnc_displayMission, 57, 2, { missionNamespace setVariable ["BIS_fnc_eventTimeline_play", false] }, _ctrlOverlay] call BIS_fnc_holdKey;
                                0 = [true, [localize "STR_A3_TO_C02_Outro_text01a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
				player allowDamage false;
				player enableSimulation false;
				10 fadeSound 0;
				//[player] joinSilent grpNull;
				player enableSimulation false;
				clearRadio;
			}
	],
	[ 51.300000, 	{
    				[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
    			}
	],
 	[ 53.830866, 	{
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				0 = [true, [localize "STR_A3_TO_C02_Outro_text02a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
			}
	],
	[ 61.511105, 	{
    				0 = [true, [localize "STR_A3_TO_C02_Outro_text02a", localize "STR_A3_TO_C02_Outro_text02b"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
       			}
	],
	[ 65.300000, 	{
    				[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
    			}
	],
	[ 69.191344, 	{
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				0 = [true, [localize "STR_A3_TO_C02_Outro_text03a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
			}
	],
 	[ 76.940774, 	{
				If (BIS_Intel) then
				{
				      0 = [true, [localize "STR_A3_TO_C02_Outro_text03a", localize "STR_A3_TO_C02_Outro_text03b"], STYLE_TWO_SENTENCES] spawn BIS_fnc_TO_AS_ShowStaticText;
				};
			}
	],
	[ 82.000000, 	{
    				[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
    			}
	],
	[ 84.525876, 	{
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				0 = [true, [localize "STR_A3_TO_C02_Outro_text04a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
    			}
	],
	[ 97.300000, 	{
    				[MODE_BLACKOUT,2.5,false] call bis_fnc_animatedScreen;
    			}
	],
	[ 99.864732,  	{ //20
				[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				0 = [true, [localize "STR_A3_TO_C02_Outro_text05a"], STYLE_ONE_SENTENCE] spawn BIS_fnc_TO_AS_ShowStaticText;
				[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
			}
	],
	[ 107.592540, 	{
				[MODE_BLACKOUT,7.3,false] call bis_fnc_animatedScreen;
				//[MODE_DESTROY] call bis_fnc_animatedScreen;
			}
	],
	[ 115.072779, 	{
				//[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
				titleCut ["", "BLACK FADED", 10e10];
				[MODE_DESTROY] call bis_fnc_animatedScreen;
			}
	],
	[ 115.272779, 	{}]
];