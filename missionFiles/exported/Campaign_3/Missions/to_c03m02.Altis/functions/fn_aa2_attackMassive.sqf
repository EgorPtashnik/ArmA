BIS_retreat = true;

// Retreat units that will not engage in combat
{
	_x disableAI "autocombat";
	_x enableAI "path";
	_x setCaptive true;
	_x setDamage 0;
} forEach ((units BIS_groupOscar) + (units BIS_groupNovember) + units BIS_groupRomeo);

{
	_x setBehaviour "AWARE";
	_x setCombatMode "BLUE";
	_x setSpeedMode "FULL";
} forEach [BIS_groupOscar, BIS_groupNovember, BIS_groupRomeo];

BIS_groupNovember setCurrentWaypoint [BIS_groupNovember, 6];
BIS_groupOscar setCurrentWaypoint [BIS_groupOscar, 4];
clearGroupIcons BIS_groupOscar;

BIS_defenseGroup addGroupIcon ["b_inf",[0,0]];
BIS_defenseGroup setGroupIconParams [[0,0.3,0.6,1],"Oscar",1,true];

["Massive Attack"] call BIS_fnc_TO_activateUnits;
// Tweak attacker's AI
{
	_x disableAI "autocombat";
} forEach (["Massive Attack"] call BIS_fnc_to_unitList);

// Phase 1: Get into positions + mortar
saveGame;
BIS_attack_1 = true;
sleep 20;

private _handle = ["ta_defending_point_superior"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
[BIS_village, 8, 100] call BIS_fnc_to_ambientMortar;

// Phase 2: Initial attack - infantry, MRAPs
BIS_attack_2 = true;
sleep 30;

// Phase 3: All attack - APC, more infantry
BIS_attack_3 = true;

private _timeout = 200;
if (isNil "BIS_areaClear") then {
	_timeout = 230;
	[] spawn {
		sleep 160;
		private _handle = ["am_no_mans_land_not_cleared"] spawn BIS_fnc_missionConversations;
	};
};

sleep _timeout;
private _handle = ["ta_retreat_in"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
if ({alive _x} count units BIS_defenseGroup > 0) then {
	private _handle = ["eve_retreat_oscar_alive"] spawn BIS_fnc_missionConversations;		
};

BIS_canRetreat = true;
sleep 5;
["tsk_defense_2", "SUCCEEDED"] call BIS_fnc_taskSetState;

// Make those units join player
//but first re-enable their pathing (ie: they'll be able to move)
{
	_x enableAI "path";
	_x setDamage 0;
} forEach units BIS_defenseGroup;

units BIS_defenseGroup join group player;

// Task: Assist second team
[
	TRUE,
	"tsk_end",
	[
		localize "STR_A3_TO_C03m02_tskEndDesc",
		localize "STR_A3_TO_C03m02_tskEndTitle",
		nil
	],
	BIS_lz_2,
	true,
	0,
	true,
	"move",
	false
] call BIS_fnc_taskCreate;