enableTeamSwitch false;
BIS_firstPosDestroyedenableTeamSwitch = false;

//trigger NATO close to CSAT house + BCP activation
_trg = createTrigger ["EmptyDetector", getMarkerPos "BIS_CSAT_civilianHousePoz"];
_trg setTriggerArea [140, 100, 0, false];
_trg setTriggerActivation ["EAST", "WEST D", false];
_trg setTriggerStatements ["this and BIS_houdanSeized", "", ""];
_trg setTriggerTimeout [10, 15, 13, false];
_trg synchronizeObjectsAdd [BCP_HouseModule];

//random start position for special squad and behaviour
SpecStart = selectRandom ["BIS_start01","BIS_start02"];

//ammount of killed civilians
BIS_CivilKilledByPlayer = 0;

//tank cover
bush01 =  createsimpleobject ["A3\plants_f\Bush\b_FicusC2s_F.p3d",agltoasl (BIS_Varsuk modelToWorld [0,0,0])];
bush01 setPos [(getPos BIS_Varsuk select 0) + 1.6,( getPos BIS_Varsuk select 1) - 2.2, (getPos BIS_Varsuk select 2) +1.8];
bush02 = createsimpleobject ["A3\plants_f\Clutter\c_StrPlantGreenShrub.p3d",agltoasl (BIS_Varsuk modelToWorld [0,0,0])];
bush02 setPos [(getPos BIS_Varsuk select 0) + 1.2,( getPos BIS_Varsuk select 1) + 0.0, (getPos BIS_Varsuk select 2) +1.9];
bush02 setDir 75;
bush03 = createsimpleobject ["A3\plants_f\Clutter\c_StrPlantGreenShrub.p3d",agltoasl (BIS_Varsuk modelToWorld [0,0,0])];
bush03 setPos [(getPos BIS_Varsuk select 0) - 0.7,( getPos BIS_Varsuk select 1) - 0.8, (getPos BIS_Varsuk select 2) +1.9];
bush04 = createsimpleobject ["A3\plants_f\Clutter\c_StrPlantGreenShrub.p3d",agltoasl (BIS_Varsuk modelToWorld [0,0,-0.3])];

//-----------------------
//conditions Infantry//
//-----------------------
//goes true, when role is selected
BIS_Infantry = false;
//goes true, when city Houdan is seized
BIS_houdanSeized = false;
//goes true, when player hit the trigger attack
BIS_DourdanAttack = false;
//goes true, when mission endings
BIS_endMissionInfantry = false;
//goes true, when supply point is seized
BIS_SuppliSeize = false;
//Goes true, when player's group detect CSAT in the civilian house
BIS_CivilianHouseSeizeDetected = false;
//goes true when armored attack on Dourdan starts
BIS_armoredCounterattack = true;
//goes true if player attack on Dourdan without reaching point Yellowstone
BIS_playerNotAtYellowstone = false;
//-----------------------
//conditions Special//
//-----------------------
//goes true, when role is selected
BIS_Special = false;
//----------------------- FOREST PART ------------------
//goes true, when tank in forest is found by players group
BIS_tankRevealed = false;
//goes true, when tank in forest is destroyed
BIS_tankGone = false;
//goes true, when Acadia area is cleared
BIS_AcadiaFall = false;
//goes true, when Arches area is cleared
BIS_ArchesFall = false;
//goes true, when Denali area is cleared
BIS_DenaliFall = false;
//goes true, when Congaree area is cleared
BIS_CongareeFall = false;
//goes true, when Everglades area is cleared
BIS_EvergladesFall = false;
//-------------------------------------------------------
//goes true, when player call for infantry attack
BIS_attackOnHoudan = false;
//goes true, when Everglades crew is spawned
BIS_CSAT_EvergladesActivated = false;
//goes true, when NATO forces are detected in Houdan
BIS_NATOinHoudan = false;
//goes true, when mortar strike end
BIS_moratEnd = false;
//goes false, when area is activated
BIS_DourdanNotActivated = true;
//goes false, when player destroy first AT poz
BIS_firstPosDestroyed = true;
//goes true, when tank fight should start
BIS_SpecialTankFight = false;

BIS_OutroEnd = false;
BIS_Intel = false;

//definition groups on point Everglades
BIS_CSAT_Reinf01 = grpNull;
BIS_CSAT_Reinf02 = grpNull;

//definition of tanks groups
BIS_VarsukDourdan = objNull;
BIS_Varsuk01 = objNull;
BIS_Varsuk02 = objNull;
BIS_kamysh01 = objNull;
BIS_Kamysh02 = objNull;

//Callsigns
BIS_Guardian setGroupID [localize "STR_A3_TO_C03_Callsign_Guardian","GroupColor0"];
BIS_BravoSpeaker setGroupID [localize "STR_A3_radio_b","GroupColor0"];
BIS_CharlieSpeaker setGroupID [localize "STR_A3_radio_c","GroupColor0"];

//amount of artillery
BIS_amountOfShots = 2;

player setvariable ["BIS_ArtTarget",0];

fnc_MortarSupport =
{
	// create Marker
 	player setvariable ["BIS_ArtTarget",(player getvariable "BIS_ArtTarget") + 1];
 	_mrk = createMarker [format (["ArtMarker_%1",player getvariable "BIS_ArtTarget"]), _this select 0];
 	_mrk setmarkershape "ELLIPSE";
 	_mrk setmarkersize [30,30];
 	_mrk setMarkerColor "ColorRed";
 	_mrk setMarkerAlpha 0.3;

	["32_Spec_PlayerSendingCoordinatesForFire"] spawn BIS_fnc_missionConversations;
 	sleep 3;
	["33_Spec_ArtilleryFire"] spawn BIS_fnc_missionConversations;

 	// send artillery fire
 	for "_i" from 0 to 2 do
 	{
  		BIS_MortarSupport doArtilleryFire [_this select 0, BIS_MortarSupport magazinesTurret [0] select 5,2];
  		sleep 4;
 	};

 	BIS_amountOfShots = BIS_amountOfShots - 1;
  	If (BIS_amountOfShots == 0) then
  	{
  		sleep 60;
  		If (alive BIS_Varsuk) then {["31_Spec_ArtilleryOffline"] spawn BIS_fnc_missionConversations};
  	};
 	sleep 10;
 	(format ["ArtMarker_%1",player getvariable "BIS_ArtTarget"]) setMarkerAlpha 0;
};

[] spawn
{
    waitUntil {BIS_CivilKilledByPlayer == 2};

    0 fadeMusic 0;
    5 fadeMusic 1;
    playMusic "LeadTrack01_F_Orange";
    player setvariable ["bis_fnc_kbTellLocal_name", Localize "STR_A3_TO_C02_CfgIdentities_Inf_Leader"];
    player setvariable ["bis_fnc_kbTellLocal_name", Localize "STR_A3_radio_a"];
    5 fadeSound 0;
    sleep 10;
    ["WarCrime",false,true,false] call BIS_fnc_endMission;
};


#include "AnimBriefing\initBriefing.sqf";



