// Include mission defines
#include "T02_defines.inc"

// Set identity to player
BIS_ARPlayer setIdentity "Tanker";

// Reset Collateral Damage - it gets triggered by the destruction of the Pyrgos base
[] spawn {
	sleep 10;
	BIS_CollateralDamage = 0;
};

// Set voice acting identities
BIS_ARHQ setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignPantheon"];
BIS_ARInfantryA setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignApollo"];
BIS_ARInfantryB setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M02_callsignDemeter"];
BIS_ARTank setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M02_callsignHades"];
BIS_ARVehicleA setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M02_callsignAthena1"];
BIS_ARVehicleB setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M02_callsignAthena2"];

// Callsigns
(group BIS_ARPlayer) setGroupID [localize "STR_A3_Tanks_M01_callsignAres"];
(group BIS_ARHQ) setGroupID [localize "STR_A3_Tanks_M01_callsignPantheon"];
BIS_grpInfSouth setGroupID [localize "STR_A3_Tanks_M01_callsignApollo"];
BIS_grpInfNorth setGroupID [localize "STR_A3_Tanks_M02_callsignDemeter1"];
BIS_grpLeopard setGroupID [localize "STR_A3_Tanks_M02_callsignHades"];
BIS_grpWiesel01 setGroupID [localize "STR_A3_Tanks_M02_callsignAthena1"];
BIS_grpWiesel02 setGroupID [localize "STR_A3_Tanks_M02_callsignAthena2"];
BIS_MortarOperator setGroupID [localize "STR_A3_Tanks_M02_markerNemesis"];
BIS_grpWiesel03 setGroupID [localize "STR_A3_Tanks_M02_callsignDemeter2"];

// Make the fuel hitpoint on Armata indestructible
[] spawn {
	while {alive BIS_Armata} do {
		BIS_Armata setHitpointDamage ["hitFuel",0];
		sleep 1;
	};
};

// Set 1st Mech Regiment insignia to appropriate units
[] spawn {
	sleep 1;
	{[_x,"AAF_1stRegiment"] call bis_fnc_setUnitInsignia} forEach [BIS_ARPlayer,BIS_Driver,BIS_Gunner];
};

// No fleeing
{_x allowFleeing 0} forEach allUnits;

// If player kills any og the AAF units in the staging area, fail the mission
{_x addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {(_this select 1) addRating -100000}}]} forEach [
	BIS_AAF_01,
	BIS_AAF_02,
	BIS_MortarDefender01,
	BIS_MortarDefender02,
	BIS_MortarOperator
];

// Initialize Collateral Damage systems
#include "CollateralDamage.inc";

// Hide markers of hidden tasks
{_x setMarkerAlpha 0} forEach [
	"BIS_mrkFOB",
	"BIS_mrkFOBArea",
	"BIS_mrkInfantryN"
];

// Remove NVGs from NATO and AAF
{if (side (group _x) == west) then {_x unlinkItem "NVGoggles"}} forEach allUnits;
{if (side (group _x) == resistance) then {_x unlinkItem "NVGoggles_indep"}} forEach allUnits;

// Give player engineer ability
BIS_ARPlayer setUnitTrait ["Engineer",true];

// Select one AMV to wait in ambush position
if (random 100 > 50) then {
	{deleteVehicle _x} forEach (units BIS_grpAMV01 + [BIS_AMV01]);
	deleteGroup BIS_grpAMV01;
} else {
	{deleteVehicle _x} forEach (units BIS_grpAMV02 + [BIS_AMV02]);
	deleteGroup BIS_grpAMV02;
};

// Ambient bombardment
[] spawn {
	sleep 15;
	while {true} do {
		_shell = "R_80mm_HE" createVehicle getMarkerPos (selectRandom [
			"BIS_mrkMortarTarget01",
			"BIS_mrkMortarTarget02",
			"BIS_mrkMortarTarget03",
			"BIS_mrkMortarTarget04",
			"BIS_mrkMortarTarget05",
			"BIS_mrkMortarTarget06",
			"BIS_mrkMortarTarget07",
			"BIS_mrkMortarTarget08"
		]);
	sleep 8 + (random 8);
	};
};

// Event handler for armor and air to play kill-confirmation conversations
{_x addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {BIS_ArmorDestroyed = true}}]} forEach [
	BIS_AMV01,
	BIS_AMV02,
	BIS_AMV03,
	BIS_Panther01,
	BIS_Panther02,
	BIS_Rooikat01,
	BIS_Rooikat02,
	BIS_Rooikat03
];

{_x addEventHandler ["Killed",{if (((_this select 1) == (vehicle BIS_ARPlayer)) and !(isTouchingGround (_this select 0))) then {BIS_AirDestroyed = true}}]} forEach [
	BIS_A10,
	BIS_VTOL,
	BIS_Huron
];

// Variable to control flow of conversations
BIS_canSpeak = true;

// AAF ORBAT updates - many vehicles were destroyed during invasion
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_cannon_F",2,0],["I_LT_01_AT_F",1,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_4",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_cannon_F",1,1],["I_LT_01_AT_F",1,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_5",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_AA_F",2,1],["I_LT_01_scout_F",0,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_E_6",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_LT_01_AA_F",3,0],["I_LT_01_scout_F",0,1]]] call bis_fnc_ORBATSetGroupParams;

[configfile >> "CfgORBAT" >> "BIS" >> "I_D_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MBT_03_cannon_F",1,0]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_D_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MBT_03_cannon_F",3,1]]] call bis_fnc_ORBATSetGroupParams;

[configfile >> "CfgORBAT" >> "BIS" >> "I_C_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_tracked_03_cannon_F",3,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_C_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_tracked_03_cannon_F",2,2]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_C_3",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_Wheeled_03_cannon_F",1,3]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_C_4",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_APC_Wheeled_03_cannon_F",3,1]]] call bis_fnc_ORBATSetGroupParams;

[configfile >> "CfgORBAT" >> "BIS" >> "I_A_2",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",1,1], ["I_MRAP_03_GMG_F",0,1]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "I_A_5",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,[["I_MRAP_03_HMG_F",2,0], ["I_MRAP_03_GMG_F",0,1]]] call bis_fnc_ORBATSetGroupParams;

// NATO ORBAT updated - do not display commander names and ranks, define vehicles which are used in mission
[configfile >> "CfgORBAT" >> "BIS" >> "B_1_C_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,"","",nil,[["B_APC_Wheeled_01_cannon_F",4,0],["B_AFV_Wheeled_01_cannon_F",4,0]]] call bis_fnc_ORBATSetGroupParams;
[configfile >> "CfgORBAT" >> "BIS" >> "B_1_B_1",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,"","",nil,[["B_APC_Wheeled_01_cannon_F",0,0]]] call bis_fnc_ORBATSetGroupParams;

// Black In at mission start
[] spawn {
	cutText ["","BLACK FADED",0];
	sleep 1;
	cutText ["","BLACK IN",3];
};
