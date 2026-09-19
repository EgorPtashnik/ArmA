// Include mission defines
#include "T01_defines.inc"

// Set identity to player and others - because of voice acting
BIS_ARPlayer setIdentity "Tanker";
BIS_ARDriver setIdentity "AR_Gekas";
// BIS_ARDriver setName ["Issakios Gekas","Issakios","Gekas"];
// BIS_ARDriver setFace "GreekHead_A3_09";

BIS_ARHunter setName (localize "STR_A3_character_ar_liakosd");
BIS_ARHunter setFace "GreekHead_A3_04";
BIS_Suspect setName (localize "STR_A3_character_ar_liakosk");

BIS_ARHQ setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignPantheon"];
BIS_AROfficer setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_identityOfficer"];
BIS_ARInfantry setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignApollo"];
BIS_ARVehicle setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_Tanks_M01_callsignHermes"];

// Set 1st Mech Regiment insignia to appropriate units
[] spawn {
	sleep 1;
	{[_x,"AAF_1stRegiment"] call bis_fnc_setUnitInsignia} forEach [BIS_ARPlayer,BIS_ARDriver,BIS_StriderC,BIS_StriderD];
};

// Make the fuel hitpoint on Wiesel indestructible
[] spawn {
	while {alive BIS_Wiesel} do {
		BIS_Wiesel setHitpointDamage ["hitFuel",0];
		sleep 1;
	};
};

// Hide markers of hidden tasks
{_x setMarkerAlpha 0} forEach [
	"BIS_mrkForest_01",
	"BIS_mrkForest_02",
	"BIS_mrkForest_03",
	"BIS_mrkForest_04",
	"BIS_mrkForest_05",
	"BIS_mrkForest_06",
	"BIS_mrkForestArea",
	"BIS_mrkVillage",
	"BIS_mrkVillageArea",
	"BIS_mrkInfantry",
	"BIS_mrkVehicle",
	"BIS_mrkMaintenance",
	"BIS_mrkFIAFlag"
];

// FIA units in Ifestiona
BIS_FIAUnits = [
	BIS_FIA_01,
	BIS_FIA_02,
	BIS_FIA_03,
	BIS_FIA_04,
	BIS_FIA_05,
	BIS_FIA_06,
	BIS_FIA_07,
	BIS_FIA_08,
	BIS_FIA_09,
	BIS_FIA_10,
	BIS_FIA_11,
	BIS_FIA_12
];

// Civilians in Ifestiona
BIS_CIVUnits = [
	BIS_Civil01,
	BIS_Civil02,
	BIS_Civil03,
	BIS_Civil04,
	BIS_Civil05,
	BIS_Civil06,
	BIS_Civil07
];

// Initialize Collateral Damage systems
#include "CollateralDamage.inc";

// Add actions to flip Wiesel back on tracks
_flipWiesel = [BIS_Wiesel, FLIP_TITLE, FLIP_ICON, FLIP_ICON, FLIP_CONDITION, FLIP_CONDITION, {}, {}, {execVM "FlipWiesel.sqf"}, {}, [], 2.0, 1000, true, false] call bis_fnc_holdActionAdd;

// Radio conversation when the Wiesel flips for the first time
[] spawn {
	waitUntil {!(canMove BIS_Wiesel) and (BIS_Wiesel getHitpointDamage 'hithull' < 1) and (BIS_Wiesel getHitpointDamage 'hitltrack' < 1) and (BIS_Wiesel getHitpointDamage 'hitrtrack' < 1) and (vehicle BIS_ARPlayer == BIS_Wiesel) and (cursorTarget == BIS_Wiesel) and (BIS_ARPlayer distance2D BIS_Wiesel < 5)};
	sleep 1;
	"FlipWiesel00" call BIS_fnc_missionConversations;
};

// Remove all NVGs and laser pointers
{if (side (group _x) == resistance) then {_x unlinkItem "NVGoggles_indep"; _x removePrimaryWeaponItem "acc_pointer_IR"}} forEach allUnits;

// If player kills the captive at the checkpoint, fail the mission
BIS_Suspect addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {(_this select 1) addRating -100000}; BIS_CollateralDamage = BIS_CollateralDamage + 45}];
/*
// If player kills any og the AAF units outside of combat area, fail the mission
{_x addEventHandler ["Killed",{if ((_this select 1) == (vehicle BIS_ARPlayer)) then {(_this select 1) addRating -100000}}]} forEach [
	BIS_AAF_Base01,
	BIS_AAF_Base02,
	BIS_AAF_Base03,
	BIS_AAF_Base04,
	BIS_AAF_Base05,
	BIS_AAF_Base06,
	BIS_AAF_Base07,
	BIS_AAF_Base08,
	BIS_AAF_Base09,
	BIS_AAF_Base10,
	BIS_AAF_Base11,
	BIS_AAF_Base12,
	BIS_ARGuard,
	BIS_RepairGuy,
	BIS_GateGuard,
	BIS_AROfficer,
	BIS_AAF_Checkpoint01,
	BIS_AAF_Checkpoint02,
	BIS_AAF_Checkpoint03,
	BIS_AAF_Checkpoint04,
	BIS_AAF_Checkpoint05,
	BIS_MohawkPilot
];
*/
// Give player engineer ability
BIS_ARPlayer setUnitTrait ["Engineer",true];

// Civilians in Ifestione - used just for counting their casualties at the mission end
BIS_CivilKIA = 0;
{_x addEventHandler ["Killed",{BIS_CivilKIA = BIS_CivilKIA + 1}]} forEach BIS_CIVUnits;

// AAF support units - used while counting their casualties at the mission end
BIS_AAFKIA = 0;
{_x addEventHandler ["Killed",{BIS_AAFKIA = BIS_AAFKIA + 1}]} forEach (units BIS_grpQRF);
{_x addEventHandler ["Killed",{BIS_AAFKIA = BIS_AAFKIA + 1}]} forEach (units BIS_grpVehicle);

// Callsigns
(group BIS_ARPlayer) setGroupID [localize "STR_A3_Tanks_M01_callsignAres"];
(group BIS_ARHQ) setGroupID [localize "STR_A3_Tanks_M01_callsignPantheon"];
BIS_grpQRF setGroupID [localize "STR_A3_Tanks_M01_callsignApollo"];
(group BIS_ARInfantry) setGroupID [localize "STR_A3_Tanks_M01_callsignApollo"];; // Fake unit to make sure conversation will be played even if the actual AI meanwhile dies
BIS_grpVehicle setGroupID [localize "STR_A3_Tanks_M01_callsignHermes"];
(group BIS_ARVehicle) setGroupID [localize "STR_A3_Tanks_M01_callsignHermes"]; // Fake unit to make sure conversation will be played even if the actual AI meanwhile dies

// No fleeing
{_x allowFleeing 0} forEach allUnits;

// Lower aim precision for FIA a bit
{if ((side _x == west) and (alive _x)) then {_x setSkill ["aimingAccuracy",0.2]}} forEach (allUnits);

// Indestructible building because of reasons (actually there's a scene inside)
BIS_Cottage = nearestObject [position BIS_CottagePos, "Building"];
BIS_Cottage allowDamage false;

// Lock the Cottage doors and hide M14
BIS_Cottage setVariable ["bis_disabled_Door_1",1];
BIS_Mk14 hideObject true;

// Make Hunter hidden until his task is activated
BIS_ARHunter hideObject true;
BIS_ARHunter enableSimulation false;
BIS_ARHunter allowDamage false;

// Event handler for player to shout out when hit
BIS_ARPlayer addEventHandler ["Hit",{
	params ["_unit","_inflicter","_hit"];
	if ((_inflicter != (vehicle BIS_ARPlayer)) and (_hit > 0.2)) then {BIS_Hit = true};
}];

// Variable to control flow of conversations
BIS_canSpeak = true;

// Black In at mission start
[] spawn {
	cutText ["","BLACK FADED",0];
	sleep 1;
	cutText ["","BLACK IN",3];
};
