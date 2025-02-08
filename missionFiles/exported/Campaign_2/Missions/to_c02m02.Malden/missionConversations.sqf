/*-----------------------------------------------------------------------------
------------------------------- INFANTRY PART ---------------------------------
-----------------------------------------------------------------------------*/
case "01_Inf_OpeningSpeechIn":
{
	["in_inf_introduction_in","to_c02_m02",nil,"vehicle"] call BIS_fnc_kbTell;

	If (isNil "BIS_InfBestPersistence" and isNil "BIS_InfNormalPersistence" and isNil "BIS_InfBadPersistence") then {["03_Inf_OpeningSpeechGood"] spawn BIS_fnc_missionConversations};
	If (!isNil "BIS_InfBestPersistence") 	then {["02_Inf_OpeningSpeechBest"] spawn BIS_fnc_missionConversations};
	If (!isNil "BIS_InfNormalPersistence") 	then {["03_Inf_OpeningSpeechGood"] spawn BIS_fnc_missionConversations};
	If (!isNil "BIS_InfBadPersistence") 	then {["04_Inf_OpeningSpeechBad"] spawn BIS_fnc_missionConversations};
};

case "02_Inf_OpeningSpeechBest":
{
	BIS_InfNormalPersistence = false;
	BIS_InfBadPersistence = false;
	["in_inf_introduction_good","to_c02_m02",nil,"vehicle"] call BIS_fnc_kbTell;
	["05_Inf_OpeningSpeechEnd"] spawn BIS_fnc_missionConversations;
};

case "03_Inf_OpeningSpeechGood":
{
	 BIS_InfNormalPersistence = true;
	 BIS_InfBestPersistence = false;
	 BIS_InfBadPersistence = false;
	["in_inf_introduction_satisfactory","to_c02_m02",nil,"vehicle"] call BIS_fnc_kbTell;
	["05_Inf_OpeningSpeechEnd"] spawn BIS_fnc_missionConversations;
};

case "04_Inf_OpeningSpeechBad":
{
	BIS_InfBestPersistence = false;
	BIS_InfNormalPersistence = false;
	["in_inf_introduction_bad","to_c02_m02",nil,"vehicle"] call BIS_fnc_kbTell;
	["05_Inf_OpeningSpeechEnd"] spawn BIS_fnc_missionConversations;
};

case "05_Inf_OpeningSpeechEnd":
{
	waitUntil {BIS_Panther01 distance getMarkerPos "BIS_Panther01WP01" < 100};
	["in_inf_introduction_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "10_Inf_Disembark":
{
	["eve_disembark","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "11_Inf_EnterTown":
{
	["ta_inf_enter_town","to_c02_m02"] call BIS_fnc_kbTell;
};

case "12_Inf_TownCapturedAlpha":
{
	["ta_inf_town_captured","to_c02_m02"] call BIS_fnc_kbTell;
	["13_Inf_RPGfromChurch"] spawn BIS_fnc_missionConversations;
};

case "12_Inf_TownCapturedAlpha_dry":
{
	["ta_inf_town_captured_dry","to_c02_m02"] call BIS_fnc_kbTell;
	["13_Inf_RPGfromChurch"] spawn BIS_fnc_missionConversations;
};

case "13_Inf_RPGfromChurch":
{
	["eve_charlie_rpg","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "14_Inf_ChurchWhiteFlag":
{
	["ta_all_first_town_captured","to_c02_m02"] call BIS_fnc_kbTell;
	If (BIS_Infantry) then
	{
		["15_Inf_AlphaSupplyDepoTask"] spawn BIS_fnc_missionConversations;
	};
};

case "15_Inf_AlphaSupplyDepoTask":
{
	["ta_inf_alpha_to_supply","to_c02_m02"] call BIS_fnc_kbTell;
};

case "16_Inf_PlayerFoundCSATOffice":
{
	["loc_inf_information","to_c02_m02"] call BIS_fnc_kbTell;
};

case "17_Inf_PlayerKillHostage":
{
	["ex_inf_execution","to_c02_m02"] call BIS_fnc_kbTell;
};

case "18_Inf_PlayerKillCiv1st":
{
	["ex_inf_civilian_killed","to_c02_m02"] call BIS_fnc_kbTell;
};

case "19_Inf_PlayerKillCiv2nd":
{
	["ex_inf_second_civilian_killed","to_c02_m02"] call BIS_fnc_kbTell;
};

case "20_Inf_CSATinFamilyHouse":
{
	["eve_inf_enemy_in_houses","to_c02_m02"] call BIS_fnc_kbTell;
};

case "21_Inf_CSATinFamilyHouseNeutralized":
{
	["eve_inf_enemy_in_houses_cleared","to_c02_m02"] call BIS_fnc_kbTell;
};

case "25_Inf_SupplyDepoSeized":
{
	["ta_inf_supply_cleared","to_c02_m02"] call BIS_fnc_kbTell;
};

case "26_Inf_APCGone":
{
	["eve_inf_panther_lost","to_c02_m02"] call BIS_fnc_kbTell;
};

case "30_Inf_AlphaYellowstoneIn":
{
	["eve_point_yellowstone","to_c02_m02"] call BIS_fnc_kbTell;
	If ({alive _x} count (units BIS_Bravo) != 0) then
	{
		["31_Inf_AlphaYellowstoneOut"] spawn BIS_fnc_missionConversations;
	}
	else
	{
		//delete marker that represents Bravo squad
		deleteMarker "BIS_INF_bravo_final";
		["32_Inf_AlphaYellowstoneOutNoBravo"] spawn BIS_fnc_missionConversations;
	};

};

case "31_Inf_AlphaYellowstoneOut":
{
	["eve_point_yellowstone_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "32_Inf_AlphaYellowstoneOutNoBravo":
{
	["eve_point_yellowstone_out_no_bravo","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "35_Inf_CSATArmoredCounterattack":
{
	["eve_inf_uav_inbound","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	//Chopper UAV
	//["eve_inf_uav_inbound_alt","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "40_Inf_NATOTanksGone":
{
	["eve_all_first_support_fail","to_c02_m02"] call BIS_fnc_kbTell;
};

case "41_Inf_NATOTanksGone2nd":
{
	["ta_all_second_support_fail","to_c02_m02"] call BIS_fnc_kbTell;
};

case "41_Inf_NATOWinSpeech":
{
	["ta_inf_second_town_captured","to_c02_m02"] call BIS_fnc_kbTell;
};

case "42_Inf_BravoSquadGone":
{
	["eve_bravo_gone","to_c02_m02"] call BIS_fnc_kbTell;
};

case "43_Inf_TankBattle":
{
	sleep 1;
	["eve_inf_tank_fire_in","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	waitUntil {!alive BIS_CSAT_target};
	["eve_inf_tank_fire_out","to_c02_m02"] call BIS_fnc_kbTell;
};

case "45_Inf_tankFireClose":
{
	["eve_inf_slammer_fires","to_c02_m02"] call BIS_fnc_kbTell;
};

case "46_Inf_attackOnHoudanWithoutYellowestone":
{
	["ex_inf_early_attack","to_c02_m02"] call BIS_fnc_kbTell;
};

case "50_Inf_openInventary":
{
	BIS_Pariah setvariable ["bis_fnc_kbTellLocal_name", Localize "STR_A3_TO_C03_CfgIdentities_Pariah_name"];
	["eve_inf_weapon_taken","to_c02_m02"] call BIS_fnc_kbTell;
	BIS_Pariah setvariable ["bis_fnc_kbTellLocal_name", Localize "STR_A3_TO_C03_Callsign_Pariah"];
};

/*----------------------------------------------------------------------------
------------------------------- SPECIAL PART ---------------------------------
-----------------------------------------------------------------------------*/

case "01_Spec_OpeningSpeech":
{
	["ta_sf_introduction_a","to_c02_m02"] call BIS_fnc_kbTell;

	If (isNil "BIS_SpecGoodPersitence" and isNil "BIS_SpecBadPersistence") then {["02_Spec_EndingGood"] spawn BIS_fnc_missionConversations};
	If (!isNil "BIS_SpecGoodPersitence") 	then {["02_Spec_EndingGood"] spawn BIS_fnc_missionConversations};
	If (!isNil "BIS_SpecBadPersistence") 	then {["03_Spec_EndingBad"] spawn BIS_fnc_missionConversations};
};

case "02_Spec_EndingGood":
{
	BIS_SpecGoodPersitence = true;
	BIS_SpecBadPersistence = false;
	["ta_sf_introduction_b_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;

	sleep 5;
	["04_Spec_situationConversation"] spawn BIS_fnc_missionConversations;
};

case "03_Spec_EndingBad":
{
	["ta_sf_introduction_c_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;

	sleep 5;
	["04_Spec_situationConversation"] spawn BIS_fnc_missionConversations;
};

case "04_Spec_situationConversation":
{
	BIS_Pariah setvariable ["bis_fnc_kbTellLocal_name", Localize "STR_A3_TO_C03_CfgIdentities_Pariah_name"];
	["am_sf_situation_chatter","to_c02_m02",[],"direct"] call BIS_fnc_kbTell;
	BIS_Pariah setvariable ["bis_fnc_kbTellLocal_name", Localize "STR_A3_TO_C03_Callsign_Pariah"];
};

case "05_Spec_AcadiaOut":
{
	["eve_sf_area_cleared_a_in","to_c02_m02"] call BIS_fnc_kbTell;
	["07_Spec_AcadiaOrArchesEnd"] spawn BIS_fnc_missionConversations;
};

case "06_Spec_ArchesOut":
{
	["eve_sf_area_cleared_b_in","to_c02_m02"] call BIS_fnc_kbTell;
	["07_Spec_AcadiaOrArchesEnd"] spawn BIS_fnc_missionConversations;
};

case "07_Spec_AcadiaOrArchesEnd":
{
	["eve_sf_area_cleared_b_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "08_Spec_CongareeOut":
{
	["eve_sf_area_cleared_d","to_c02_m02"] call BIS_fnc_kbTell;
};

case "09_Spec_DenaliOut":
{
	["eve_sf_area_cleared_c","to_c02_m02"] call BIS_fnc_kbTell;
};

case "17_Spec_PlayerKillHostage":
{
	["ex_sf_execution","to_c02_m02"] call BIS_fnc_kbTell;
};
case "18_Spec_PlayerKillCiv1st":
{
	["ex_sf_civilian_killed","to_c02_m02"] call BIS_fnc_kbTell;
};

case "19_Spec_PlayerKillCiv2nd":
{
	["ex_sf_second_civilian_killed","to_c02_m02"] call BIS_fnc_kbTell;
};

case "20_Spec_CallCongareeAndDenali":
{
	["ta_all_ambush_a_in","to_c02_m02"] call BIS_fnc_kbTell;
	["24_Spec_InfantryCanGo"] spawn BIS_fnc_missionConversations;
};

case "21_Spec_CallCongareeOrDenali":
{
	["ta_all_ambush_a_alone_in","to_c02_m02"] call BIS_fnc_kbTell;
	["24_Spec_InfantryCanGo"] spawn BIS_fnc_missionConversations;
};

case "22_Spec_CallCongareeAndDenaliAndTank":
{
	["ta_sf_ambush_b_in","to_c02_m02"] call BIS_fnc_kbTell;
	["24_Spec_InfantryCanGo"] spawn BIS_fnc_missionConversations;
};

case "23_Spec_CallCongareeOrDenaliAndTank":
{
	["ta_sf_ambush_c_in","to_c02_m02"] call BIS_fnc_kbTell;
	["24_Spec_InfantryCanGo"] spawn BIS_fnc_missionConversations;
};

case "24_Spec_InfantryCanGo":
{
	["ta_sf_ambush_order","to_c02_m02"] call BIS_fnc_kbTell;
	If (getMarkerColor "BIS_Evergldes" == "ColorGreen") then
	{
		If (count units group player > 1) then
			{
				["25_Spec_ReinfAlreadyGonePlayerHaveSquad"] spawn BIS_fnc_missionConversations;
			}
			else
			{
				["26_Spec_ReinfAlreadyGonePlayerAlone"] spawn BIS_fnc_missionConversations;
			}
	}
	else
	{
		If (count units group player > 1) then
			{
				["27_Spec_GoDoThatPlayerHaveSquad"] spawn BIS_fnc_missionConversations;
			}
			else
			{
				["28_Spec_GoDoThatPlayerAlone"] spawn BIS_fnc_missionConversations;
			}

	};

};

case "25_Spec_ReinfAlreadyGonePlayerHaveSquad":
{
	["ta_sf_support_infantry","to_c02_m02"] call BIS_fnc_kbTell;
};

case "26_Spec_ReinfAlreadyGonePlayerAlone":
{
	["ta_sf_support_infantry_alone_a","to_c02_m02"] call BIS_fnc_kbTell;
};

case "27_Spec_GoDoThatPlayerHaveSquad":
{
	["ta_sf_ambush_order_simple","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "28_Spec_GoDoThatPlayerAlone":
{
	["ta_sf_ambush_order_done_alone","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	["ta_sf_support_infantry_alone_b","to_c02_m02"] call BIS_fnc_kbTell;
};

case "29_Spec_SpotedTankInForest":
{
	["ta_sf_tank_in_forest","to_c02_m02"] call BIS_fnc_kbTell;
	supportFire01 = [player,"BIS_MortarSupport"] call BIS_fnc_addCommMenuItem;
	supportFire02 = [player,"BIS_MortarSupport",nil,nil,""] call BIS_fnc_addCommMenuItem;
};

case "30_Spec_EliminatedTankInForest":
{
	["ta_sf_tank_destroyed_in_a","to_c02_m02"] call BIS_fnc_kbTell;
	["ta_sf_tank_destroyed_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "31_Spec_ArtilleryOffline":
{
	["ex_sf_no_artillery","to_c02_m02"] call BIS_fnc_kbTell;
};

case "32_Spec_PlayerSendingCoordinatesForFire":
{
	["sup_sf_artillery_request","to_c02_m02"] call BIS_fnc_kbTell;
};

case "33_Spec_ArtilleryFire":
{
	["sup_artillery_support","to_c02_m02",["",("to_c02_m02_086_sup_artillery_support_PARIAH_1")]] call BIS_fnc_kbTell;
	sleep 6;
	["sup_artillery_support","to_c02_m02",["to_c02_m02_086_sup_artillery_support_GUARDIAN_0",("to_c02_m02_086_sup_artillery_support_GUARDIAN_1")]] call BIS_fnc_kbTell;
};

case "34_Spec_EliminatedTankInForestArtillery":
{
	//effect around the tank

	BIS_objs = [];
   {
       if(typeOf(_x) == "") then {
          BIS_objs set [count BIS_objs, _x];

            };
   } forEach (nearestObjects [BIS_Varsuk, [], 30]);
   {_x setDamage 1} forEach BIS_objs;

	["ta_sf_tank_destroyed_in_b","to_c02_m02"] call BIS_fnc_kbTell;
	["ta_sf_tank_destroyed_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "35_Spec_CSATReinfEliminated":
{
	["ta_all_reinforcements_neutralized","to_c02_m02"] call BIS_fnc_kbTell;
};

case "35_Spec_CSATReinfEliminated_dry":
{
	["ta_all_reinforcements_neutralized_dry","to_c02_m02"] call BIS_fnc_kbTell;
};

case "36_Spec_CSATReinfPassIn":
{
	["ta_sf_reinforcements_in","to_c02_m02"] call BIS_fnc_kbTell;

	If (count units group player > 1) then
	{
		["37_Spec_CSATReinfPassContinueSquad"] spawn BIS_fnc_missionConversations;
	}
	else
	{
		["38_Spec_CSATReinfPassContinueAlone"] spawn BIS_fnc_missionConversations;
	};
};

case "37_Spec_CSATReinfPassContinueSquad":
{
	["ta_sf_reinforcements","to_c02_m02"] call BIS_fnc_kbTell;
	["39_Spec_CSATReinfPassOut"] spawn BIS_fnc_missionConversations;
};

case "38_Spec_CSATReinfPassContinueAlone":
{
	["ta_sf_reinforcements_alone","to_c02_m02"] call BIS_fnc_kbTell;
	["39_Spec_CSATReinfPassOut"] spawn BIS_fnc_missionConversations;
};

case "39_Spec_CSATReinfPassOut":
{
	["ta_sf_reinforcements_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "40_Spec_PlayerFoundCSATOffice":
{
	["loc_sf_information","to_c02_m02"] call BIS_fnc_kbTell;
};

case "50_Spec_AlphaIsHitTank":
{
	BIS_Slammer01 action ["useWeapon", BIS_Slammer01, commander BIS_Slammer01, 5];
	["eve_sf_nato_ambushed_bravo_tank","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	["52_Spec_IsHitTankOut"] spawn BIS_fnc_missionConversations;
};

case "51_Spec_BravoIsHitTank":
{
	BIS_Panther01 action ["useWeapon", BIS_Panther01, commander BIS_Panther01, 0];
	["eve_sf_nato_ambushed_alpha_tank","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	["52_Spec_IsHitTankOut"] spawn BIS_fnc_missionConversations;
};

case "52_Spec_IsHitTankOut":
{
	["eve_sf_nato_ambushed_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "53_Spec_AlphaIsHitRPG":
{
	BIS_Slammer01 action ["useWeapon", BIS_Slammer01, commander BIS_Slammer01, 5];
	["eve_sf_nato_at_bravo_in","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	sleep 5;
	["55_Spec_IsHitRPGOut"] spawn BIS_fnc_missionConversations;
};

case "54_Spec_BravoIsHitRPG":
{
	BIS_Panther01 action ["useWeapon", BIS_Panther01, commander BIS_Panther01, 0];
	["eve_sf_nato_at_alphaspeaker_in","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	["55_Spec_IsHitRPGOut"] spawn BIS_fnc_missionConversations;
};

case "55_Spec_IsHitRPGOut":
{
	["eve_sf_nato_ambushed_tank_out","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};

case "59_Spec_WatchOnPrisoners":
{
	["ta_sf_prisoners_secured","to_c02_m02"] call BIS_fnc_kbTell;
	["60_Spec_PrisonersSpeekOpening"] spawn BIS_fnc_missionConversations;
};

case "60_Spec_PrisonersSpeekOpening":
{
	["eve_sf_change_of_plan_a","to_c02_m02",[],"direct"] call BIS_fnc_kbTell;
	["61_Spec_PrisonersSpeekPlayerToHQ"] spawn BIS_fnc_missionConversations;
};

case "61_Spec_PrisonersSpeekPlayerToHQ":
{
	["eve_sf_change_of_plan_b","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;

	//creating UAV
	BIS_UAV = [getPos BIS_UAVpoz, 0, "B_UAV_02_F", WEST] call BIS_fnc_spawnVehicle;
	//BIS_UAV = [getPos BIS_UAVpoz, 0, "B_T_UAV_03_dynamicLoadout_F", WEST] call BIS_fnc_spawnVehicle;
	createVehicleCrew (BIS_UAV select 0);
	BIS_UAV_DRIVER = BIS_UAV select 0;
	BIS_UAV_CAPTIVE = BIS_UAV select 1;
	BIS_UAV_DRIVER flyInHeight 1000;
	BIS_UAV_DRIVER setSpeedMode "FULL";
	BIS_UAV_DRIVER setCaptive true;
	{_x setCaptive true} forEach BIS_UAV_CAPTIVE;
	_wp1 = group BIS_UAV_DRIVER addwaypoint [[7040.95,7137.5,1000],0];
	_wp1 setWaypointtype "HOLD";

	If (player isUAVConnectable [BIS_UAV_DRIVER,true]) then

	//player can connect to UAV
	{
		["62_Spec_PlayerWillConnect"] spawn BIS_fnc_missionConversations;

		[
			WEST,
			"BIS_c02_m02_ts08",
			[

		format [
					localize "STR_A3_TO_c02m02_Task08_SPEC_Description"
			   ],
		"STR_A3_TO_c02m02_Task08_SPEC_Destination",
				nil
			],
			getMarkerPos "BIS_Task04",
			true,
			nil,
			true,
			"use",
			false
		] call BIS_fnc_taskCreate;

		["BIS_c02_m02_ts08", "ASSIGNED"] call BIS_fnc_taskSetState;
	}
	else
	//player can't connect to UAV
	{
		["63_Spec_PlayerCantConnect"] spawn BIS_fnc_missionConversations;

	}
};

case "62_Spec_PlayerWillConnect":
{
	["ta_sf_change_of_plan_c","to_c02_m02"] call BIS_fnc_kbTell;
};

case "63_Spec_PlayerCantConnect":
{
	["ta_sf_change_of_plan_d","to_c02_m02"] call BIS_fnc_kbTell;
};

case "64_Spec_PlayerTakeTerminalFromTruck":
{
	["ta_sf_terminal","to_c02_m02"] call BIS_fnc_kbTell;
};

case "65_Spec_PlayerIn":
{
	["ta_sf_terminal_connected","to_c02_m02"] call BIS_fnc_kbTell;
};

case "66_Spec_ArmoredNeutralized":
{
	["ta_sf_counterattacked_neutralized","to_c02_m02"] call BIS_fnc_kbTell;
	sleep 5;
	["41_Inf_NATOWinSpeech"] spawn BIS_fnc_missionConversations;
};

case "67_Spec_UAVIsShotedDown":
{
	["eve_sf_uav_destroyed","to_c02_m02"] call BIS_fnc_kbTell;
	/*["ex_sf_uav_crashed","to_c02_m02"] call BIS_fnc_kbTell; // UAV Crashed by player*/
	["69_Spec_UAVIsShotedDown"] spawn BIS_fnc_missionConversations;
};

case "69_Spec_UAVIsShotedDown":
{
	["ex_sf_uav_improvise","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	/*["ex_sf_uav_crashed_out","to_c02_m02"] call BIS_fnc_kbTell; UAV crashed out */
};

case "70_Spec_UAVOutOfAmmo":
{
	["ex_sf_uav_winchester","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	["71_Spec_RequestDennied"] spawn BIS_fnc_missionConversations;
};

case "71_Spec_RequestDennied":
{

	["ex_sf_uav_winchester_out_a","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
	/*["ex_sf_uav_winchester_out_b","to_c02_m02",nil,"side"] call BIS_fnc_kbTell; improvise on the foot*/
};

case "72_Spec_MedicSay":
{

	["eve_sf_weapon_taken_remark","to_c02_m02",nil,"side"] call BIS_fnc_kbTell;
};