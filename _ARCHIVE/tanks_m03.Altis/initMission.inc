// Set identities to player
BIS_ARPlayer setIdentity "Tanker";

// Set voice acting identities
BIS_ARHQ setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignPantheon"];
BIS_ARDefenderA setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignApollo"];
BIS_ARDefenderB setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M03_callsignZeus"];
BIS_ARDefenderC setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M02_callsignDemeter"];
BIS_ARDefenderD setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M03_callsignArtemis"];
// BIS_ARPilot setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Codename_November"];

// Callsigns
(group BIS_ARPlayer) setGroupID [localize "STR_A3_Tanks_M01_callsignAres"];
(group BIS_ARHQ) setGroupID [localize "STR_A3_Tanks_M01_callsignPantheon"];

// Make the fuel hitpoint on Armata indestructible
[] spawn {
	while {alive BIS_Armata} do {
		BIS_Armata setHitpointDamage ["hitFuel",0];
		sleep 1;
	};
};

// Hide markers of hidden tasks
{_x setMarkerAlpha 0} forEach [
	"BIS_mrkEastAttack01",
	"BIS_mrkEastAttack02",
	"BIS_mrkPanagiaArea"
];

// Set 1st Mech Regiment insignia to appropriate units
[] spawn {
	sleep 1;
	{[_x,"AAF_1stRegiment"] call bis_fnc_setUnitInsignia} forEach [BIS_ARPlayer,BIS_ARDriver,BIS_Gunner];
};

// Adjust the cargo of Armata
{clearMagazineCargo _x, clearWeaponCargo _x, clearItemCargo _x, clearBackpackCargo _x} forEach [BIS_Armata];

// Remove smoke CMs from enemy vehicles... let the missiles hit the tanks, let the missiles hit the tanks, let the missiles hit the... TAAAAAAANKS!
{_x removeMagazineTurret ["SmokeLauncherMag",[0,0]]} forEach [
	BIS_Rooikat01,
	BIS_Rooikat02,
	BIS_Rooikat03,
	BIS_Slammer01,
	BIS_Slammer02,
	BIS_Slammer03,
	BIS_Slammer04,
	BIS_Slammer05,
	BIS_Slammer06,
	BIS_Cheetah01,
	BIS_Marshall01
];

// No fleeing
{_x allowFleeing 0} forEach allUnits;

// No NVGs
{if (side (group _x) == west) then {_x unlinkItem "NVGoggles"}} forEach allUnits;
{if (side (group _x) == resistance) then {_x unlinkItem "NVGoggles_indep"}} forEach allUnits;

// Event handlers for armor to play kill-confirmation conversations
{_x addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {BIS_ArmorKill01 = true}}]} forEach [
	BIS_Rooikat01,
	BIS_Rooikat02,
	BIS_Slammer01,
	BIS_Slammer02,
	BIS_Slammer03,
	BIS_Slammer04,
	BIS_Slammer05,
	BIS_Cheetah01
];

{_x addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {BIS_ArmorKill02 = true}}]} forEach [
	BIS_Slammer06,
	BIS_Rooikat03,
	BIS_Marshall01
];

// Variable to control flow of conversations
BIS_canSpeak = true;

/*
// If player kills any of the AAF units in the medical area, mission ends as FF
{_x addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {(_this select 1) addRating -100000}}]} forEach [
	BIS_Mourner,
	BIS_Injured01,
	BIS_Injured02
];
*/

// ORBAT updates - many vehicles were destroyed during invasion
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_cannon_F",1,1],["I_LT_01_scout_F",1,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_cannon_F",0,2],["I_LT_01_AT_F",1,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_3",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_cannon_F",1,1],["I_LT_01_AT_F",1,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_4",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_cannon_F",0,2],["I_LT_01_AT_F",1,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_5",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_AA_F",2,1],["I_LT_01_scout_F",0,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_6",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_AA_F",2,1],["I_LT_01_scout_F",0,1]]] call bis_fnc_ORBATSetGroupParams;

[configfile >> "CfgORBAT" >> "BIS" >> "I_D_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_tracked_03_cannon_F",1,0],["I_MBT_03_cannon_F",2,0],["O_MBT_04_cannon_F",1,0]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_D_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_tracked_03_cannon_F",1,0],["I_APC_Wheeled_03_cannon_F",1,0],["I_MBT_03_cannon_F",2,0]]] call bis_fnc_ORBATSetGroupParams;

// [configfile >> "CfgORBAT" >> "BIS" >> "I_D_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MBT_03_cannon_F",0,4]]] call bis_fnc_ORBATSetGroupParams;
// [configfile >> "CfgORBAT" >> "BIS" >> "I_D_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MBT_03_cannon_F",1,3]]] call bis_fnc_ORBATSetGroupParams;

[configfile >> "CfgORBAT" >> "BIS" >> "I_C_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_tracked_03_cannon_F",2,2]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_C_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_tracked_03_cannon_F",1,3]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_C_3",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_Wheeled_03_cannon_F",1,3]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_C_4",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_Wheeled_03_cannon_F",2,2]]] call bis_fnc_ORBATSetGroupParams;

[configfile >> "CfgORBAT" >> "BIS" >> "I_A_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",2,0], ["I_MRAP_03_GMG_F",0,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_A_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",1,1], ["I_MRAP_03_GMG_F",0,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_A_3",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",0,2], ["I_MRAP_03_GMG_F",1,0]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_A_4",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",1,1], ["I_MRAP_03_GMG_F",1,0]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_A_5",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",1,1], ["I_MRAP_03_GMG_F",0,1]]] call bis_fnc_ORBATSetGroupParams;

// NATO ORBAT updated - do not display commander names and ranks, define vehicles which are used in mission
[configfile >> "CfgORBAT" >> "BIS" >> "B_2_E",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,"","",nil,[["B_APC_Wheeled_01_cannon_F",4,0],["B_AFV_Wheeled_01_cannon_F",4,0],["B_MBT_01_cannon_F",4,0],["B_MBT_01_TUSK_F",4,0]]] call bis_fnc_ORBATSetGroupParams;

// Black In at mission start
[] spawn {
	cutText ["","BLACK FADED",0];
	sleep 1;
	cutText ["","BLACK IN",3];
};
