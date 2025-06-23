#define DEBUG false

if(!DEBUG) then
{
	setDate [2035, 8, 9, 4, 45];
};

BIS_sendTruck = false;
MINUTE = 60;

//Disable environment sounds
private _group = createGroup west;
[player] joinSilent _group;

enableEnvironment false;
player setvariable ["bis_fnc_kbTellLocal_name", localize "STR_A3_TO_C03_CfgIdentities_Barklem_nameShort"];
player setIdentity "TO_C03_Barklem"; 

{_x allowFleeing 0} forEach allUnits;

{
	_x setSkill 0.3;
	_x setSkill ["aimingAccuracy", 0.2];
	_x setSkill ["spotDistance", (_x skill "spotDistance") - 0.2];
	_x setSkill ["spotTime", (_x skill "spotTime") - 0.2];
} forEach (allUnits select {side group _x == RESISTANCE});

private _deactivate = [
	"Enemy Patrols", 
	BIS_wreckPatrol, 
	BIS_attack_1, 
	BIS_attack_2, 
	BIS_attack_3, 
	BIS_infiltratorGroup, 
	"Beach Guards", 
	"Captive Fighters", 
	"Recon House","Pilot",
	"ERV",
	"Mortar",
	"Backup Forces_1"
];

//add event handlers for handling vehicles when hit
BIS_to_zamak1 setVariable
[
	"BIS_to_zamak1EH",	
	BIS_to_zamak1 addEventHandler    
	[   
		"Hit",    
		{   
			if( {alive _x} count (crew BIS_to_zamak1) < 4) then 
			{ 
				(group BIS_to_zamak1) addWaypoint [position BIS_zamak1Waypoint, 0];   
				BIS_to_zamak1 limitSpeed 100;  
				BIS_to_zamak1 removeEventHandler["Hit", BIS_to_zamak1 getVariable "BIS_to_zamak1EH"];
			}; 
		}   
	]
];

BIS_to_Strider setVariable
[
	"BIS_to_StriderEH",
	BIS_to_Strider addEventHandler  
	[ 
		"Hit",  
		{ 
			BIS_to_Strider limitSpeed 70; 
			BIS_to_Strider removeEventHandler["Hit", BIS_to_Strider getVariable "BIS_to_StriderEH"];
		} 
	]
];

_deactivate call BIS_fnc_TO_deactivateUnits;
["Beach Guards"] call BIS_fnc_TO_activateUnits;

// Set counter of dead
BIS_to_m1_nDead_NATO = 0;
BIS_to_m1_nDead_AAF = 0;
BIS_to_m1_nDead_CSAT = 0;
addMissionEventHandler ["EntityKilled",{
	switch (side group (_this select 0)) do {
		case WEST: {BIS_to_m1_nDead_NATO = BIS_to_m1_nDead_NATO + 1};
		case EAST: {BIS_to_m1_nDead_CSAT = BIS_to_m1_nDead_CSAT + 1};
		case RESISTANCE: {BIS_to_m1_nDead_AAF = BIS_to_m1_nDead_AAF + 1};
	};
}];

["Init", []] call BIS_fnc_moduleFriendlyFire;

// Small functions used later in mission
BIS_fnc_aa1_fireFlare = {
	params ["_pos",["_type","F_40mm_white"]];
	if (_pos isEqualType objNull) then {
		_pos = getPos _pos;
	};
	_pos set [2, 200];
	private _obj = _type createvehicle _pos;
	_obj setVelocity [0,0,-10];
};

BIS_fnc_TO_failUnfinishedTasks = {
	{
		private _state = [_x] call BIS_fnc_taskState;
		if (_state == "CREATED" || _state == "ASSIGNED") then {
			[_x, "FAILED", false] call BIS_fnc_taskSetState;
		};
	} forEach ["tsk_pilot","tsk_regroup","tsk_medic","tsk_recon","tsk_supplies","tsk_defend"];
};

BIS_doFlares = 
{
	params ["_vehicle"];
	for "_i" from 0 to 5 do 
	{
		_vehicle action ["useWeapon", _vehicle, driver _vehicle, 0];
		sleep 0.35;
	};
};

//
// Animated briefing section
//

// Disable animation of all airplanes and falling objects at the start of the mission
BIS_vtols = [BIS_heli_7, BIS_heli_5, BIS_heli_4, BIS_heli_fake];
private _unitsToFreeze = BIS_vtols + (["Paratroopers"] call BIS_fnc_to_unitList) + [BIS_supply_1];

{
	_x enableSimulation false;
} forEach _unitsToFreeze;



if(DEBUG) then
{
	// Prepare gameplay zones
	execFSM "fsms\pilot.fsm";
	execFSM "fsms\medic.fsm";
};

if(!DEBUG) then
{
	private _handle = execVM "AnimBriefing\initBriefing.sqf";
	waitUntil {scriptDone _handle};

	//remove headphone SFX if it exists
	if(!isNil "BIS_AirAssaultSpeakerHeadphones") then
	{
		deletevehicle BIS_AirAssaultSpeakerHeadphones;
	};

	// --- INTRO TIMING SCRIPT ---
	//shake map to simulate hits
	playSound "vtolHit1";
	playSound "vtolHit1";
	playSound "vtolHit1";
	[0.8,80,getMarkerPos "mrk_rect_1"] call BIS_fnc_shakeMap;

	sleep 0.5;

	//dialogues
	[] spawn 
	{
		BIS_fnc_Crashspeaker1 = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];
		BIS_fnc_Crashspeaker2 = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];

		["to_c03_m01_brief_001_br_briefing_BOWKER_20", "BOWKER", BIS_fnc_Crashspeaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
		sleep 0.9;

		//bark1	
		["to_c03_m01_brief_001_br_briefing_BARKLEM_1", "BARKLEM", BIS_fnc_Crashspeaker2] spawn BIS_fnc_TO_playSoundAndSubtitles;
		sleep 0.8;

		//pilot2
		["to_c03_m01_brief_001_br_briefing_PILOT02_2", localize "STR_a3_c_man_pilot_f0", BIS_fnc_Crashspeaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;		
	};

	BIS_alarmSoundLooper = [] spawn
	{
		BIS_AirAssaultSpeakerAlarm = "Sign_Arrow_Large_Pink_F" createVehicle [0,0,0];
		while{true} do
		{
			BIS_AirAssaultSpeakerAlarm say2D "vtolAlarm";
			sleep 2;
		};	
	};

	["Pilot","We’re under fire! Mayday, mayday, we’re going down!"] call BIS_fnc_showSubtitle;

	sleep 3;

	playSound "vtolHit2";
	playSound "vtolHit2";
	playSound "vtolHit2";
	[0.8,100,getMarkerPos "mrk_rect_1"] call BIS_fnc_shakeMap;
	sleep 0.5;

	sleep 4;

	playSound "vtolHit3";
	playSound "vtolHit3";
	playSound "vtolHit3";
	[0.8,120,getMarkerPos "mrk_rect_1"] call BIS_fnc_shakeMap;
	sleep 1.5;
	
	//make sound fade to 0 and screen fade to black
	2.5 fadeSound 0;

	terminate BIS_alarmSoundLooper;
	deletevehicle BIS_AirAssaultSpeakerAlarm;

	if(!isNil "BIS_AirAssaultSpeaker1") then
	{
		deletevehicle BIS_AirAssaultSpeaker1;
	};
	if(!isNil "BIS_AirAssaultSpeaker2") then
	{
		deletevehicle BIS_AirAssaultSpeaker2;
	};
	if(!isNil "BIS_AirAssaultSpeaker3") then
	{
		deletevehicle BIS_AirAssaultSpeaker3;
	};

	cutText ["","BLACK FADED",2];

	sleep 0.5;
};

//add event handler for getting hit
player setVariable[
	"BIS_to_hitEventHandler", 
	player addEventHandler 
	[
		"Hit", 
		{
			["ex_player_wounded","to_c03_m01"] call BIS_fnc_kbTell;
			player removeEventHandler["Hit", player getVariable "BIS_to_hitEventHandler"];
		}
	]
];

//teleport player to crash site (is this needed?)
player setPos (getPos BIS_playerWakeUpPosition); 

//delete fake vtol and apcs
{
	{ deleteVehicle _x } forEach crew _x;
	deleteVehicle _x;
} 
forEach [BIS_heli_fake, BIS_apcC, BIS_apcD];

BIS_vtols = [BIS_heli_4, BIS_heli_5];
_unitsToFreeze = _unitsToFreeze - BIS_vtols;
//Enable animation most stuff except for vtols which are gonna be enabled 1 by 1
{
	_x enableSimulation true;
} forEach _unitsToFreeze;

//Disable environment sounds
enableEnvironment true;

//unforce and close the map (while screen is still black)
openMap [false, false];
//show map controls (diary, etc...)
[true] call BIS_fnc_TO_showMapControls;

//create new group for player (so that he won't be in the APC group) and so that when new people join player's group player won't be number 3
[player] joinSilent (createGroup west);
player allowDamage true;
player setCaptive false;

if(!DEBUG) then
{
	player setUnconscious true;
	
	//faDe in the sound
	4 fadeSound 1;

	sleep 7;

	//face vtol while unconscious
	player setDir 115;

	cutText ["","BLACK IN",3];
	
	sleep 19;

	cutText ["","BLACK OUT",1];
	sleep 1;
	player setUnconscious false;
	sleep 0.2;
	//face vtol while standing
	player setDir 295;
	sleep 0.3;
	player switchMove "UnconsciousMedicOutPistol";
	
	cutText ["","BLACK IN",1];

	sleep 3;

	["01_commAttempt"] spawn BIS_fnc_missionConversations;
};

BIS_introEnded = time;

// --- END TIMING SCRIPT ---

if(!DEBUG) then
{
	// Prepare gameplay zones
	execFSM "fsms\pilot.fsm";
	execFSM "fsms\medic.fsm";
};