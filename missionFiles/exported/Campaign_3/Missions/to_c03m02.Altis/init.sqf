// Set up basic systems
//addMissionEventHandler ["Loaded",{hint "loaded";[] call BIS_fnc_aa2_loadPersistence}];
["Init", []] call BIS_fnc_moduleFriendlyFire;

//player setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_TO_C03_CfgIdentities_Barklem_nameShort"];
//player setName localize "STR_A3_TO_C03_CfgIdentities_Barklem_name";
player setIdentity "TO_C03_Barklem";

[] spawn {
	0 fadeSound 0;
	sleep 3;
	0 fadeSound 1;
};

// Adjust player and APC
player setUnitTrait ["engineer",true];
BIS_apc setHitPointDamage ["hitEngine",0.95];
BIS_apc allowCrewInImmobile true;
BIS_apc setUnloadInCombat [FALSE,FALSE];
BIS_apc disableTIEquipment true;
BIS_apc disableNVGEquipment true;

// Set groupIcons your squads
setGroupIconsVisible [true,false];
BIS_groupRomeo addGroupIcon ["b_inf",[0,0]];
BIS_groupNovember addGroupIcon ["b_inf",[0,0]];
BIS_groupOscar addGroupIcon ["b_inf",[0,0]];
BIS_groupRomeo setGroupIconParams [[0,0.3,0.6,1],"Pariah",1,true]; // TODO: Localize
BIS_groupNovember setGroupIconParams [[0,0.3,0.6,1],"November",1,true];
BIS_groupOscar setGroupIconParams [[0,0.3,0.6,1],"Oscar",1,true];

addMissionEventHandler ["EntityKilled",{
	switch (side group (_this select 0)) do {
		case WEST: {BIS_to_m2_nDead_NATO = BIS_to_m2_nDead_NATO + 1};
		case EAST: {BIS_to_m2_nDead_CSAT = BIS_to_m2_nDead_CSAT + 1};
		case RESISTANCE: {BIS_to_m2_nDead_AAF = BIS_to_m2_nDead_AAF + 1};
	};
}];

// Ambient mortar function that is trying to kill player
BIS_fnc_to_ambientMortar = {
	params ["_target",["_shotCount",4],["_accuracy",50]];
	BIS_mortar addMagazineTurret ["8Rnd_82mm_Mo_shells",[-1]];

	// safezone near LZ Stallion
	if (_target distance getMarkerPos "mrk_lz" < 200) exitWith {};

	for "_i" from 1 to _shotCount do {
		// randomize position
		private _targetPos = _target;
		if (_target isEqualType objNull) then {
			_targetPos = getPos _target;
		};
		private _randomX = (_targetPos select 0) + ((random _accuracy) * 2 - _accuracy);
		private _randomY = (_targetPos select 1) + ((random _accuracy) * 2 - _accuracy);
		sleep 5;
		BIS_mortar doArtilleryFire [[_randomX, _randomY, 0], "8Rnd_82mm_Mo_shells", 1];
	};
};


// Deactivate all enemies and friendlies at LZ Stallion
["Ruins","Village","Attack RP1","LZ","Massive Attack", "Flatlands","Scout Attack",BIS_groupCrew] call BIS_fnc_to_deactivateUnits;
{_x allowFleeing 0} forEach allGroups;

// Make wounded unit lay on the ground
BIS_wounded = ["Wounded"] call BIS_fnc_to_unitList;

[] spawn {
	sleep 10;
	{
		if (typeOf _x != "B_Medic_F") then {
			//_x setUnconscious true;
			_x setCaptive true;
			_x setDamage 0.7;
			_x setHit ["legs", 0.9];
		};
	} forEach BIS_wounded;
	sleep 10;
	{
		if (typeOf _x != "B_Medic_F") then {
			//_x setUnconscious true;
			_x setCaptive true;
			_x setDamage 0.7;
			_x setHit ["legs", 0.9];
		};
	} forEach BIS_wounded;
};

BIS_wounded_start = count BIS_wounded;

// Exchange AT launcher to every AT Rifleman
{
	_x setSkill 0.2;
	_x setSkill ["aimingAccuracy",0.15];

	if (typeOf _x == "I_soldier_LAT_F") then {
		_x removeMagazines "NLAW_F";
		_x removeWeapon "launch_NLAW_F";
		_x addMagazines ["RPG32_HE_F",3];
		_x addWeapon "launch_RPG32_F";
	};

	if (vehicle _x != _x) then {
		_x setSkill ["aimingAccuracy",0.1];
		_x setSkill ["aimingShake",0.1];
	};
} forEach (allUnits select {side _x == RESISTANCE});

//hint "Loading mission";
[] spawn BIS_fnc_aa2_loadPersistence;

// Count dead
if (isNil "BIS_to_m2_nDead_NATO") then {
	BIS_to_m2_nDead_NATO = 0;
	BIS_to_m2_nDead_CSAT = 0;
	BIS_to_m2_nDead_AAF = 0;
} else {
	BIS_to_m2_nDead_NATO = BIS_to_m1_nDead_NATO;
	BIS_to_m2_nDead_CSAT = BIS_to_m1_nDead_CSAT;
	BIS_to_m2_nDead_AAF = BIS_to_m1_nDead_AAF;
};

// Run animated briefing
#define DEBUG_MODE false
if (!DEBUG_MODE) then {
	private _handle = execVM "AnimBriefing\initBriefing.sqf";
	waitUntil {scriptDone _handle};
};

// Mortar
[] spawn {
	{
		_b = "Sh_82mm_AMOS" createVehicle getPos _x;
		_b setVelocity [0,0,-1];
		sleep 3;
	} forEach [BIS_target_1,BIS_target_2,BIS_target_3,BIS_target_4,BIS_target_5];
};

sleep 1;
// Last dialogue
["br_mortar"] spawn BIS_fnc_missionConversations;
openMap [false,false];

[player] joinSilent BIS_groupRomeo;
sleep 12;
saveGame;
BIS_mortarDone = true;

// Handle alternate mission ending - lost APC
[] spawn {
	waitUntil {
		sleep 1;
		!alive BIS_apc && alive player
	};
	sleep 5;
	private _handle = ["ex_apc_destroyed"] spawn BIS_fnc_missionConversations;
	waitUntil {scriptDone _handle};
	setCustomMissionData ["Fail1", "Infantry"];
	["fail1",false] call BIS_fnc_endMission;
};

// setup damage of VTOL
sleep 1;
BIS_vtol_2 setDamage [1,false];
BIS_vtol_2 setDamage [0.9,false];

[] spawn {
	while {true} do {
		sleep 1;
		if (BIS_apc getHitPointDamage "HitFuel" > 0.7) then {
			BIS_apc setHitPointDamage ["HitFuel",0.7];
		};
	};
};