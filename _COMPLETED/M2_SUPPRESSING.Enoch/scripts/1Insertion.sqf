"taskInsertion" call EP_fnc_missionTasks;

// Music + intro
["black", false] call BIS_fnc_blackOut;
playMusic "LeadTrack06_F";
player addBackpack "B_Parachute";
private _pos = player call EP_fnc_getPosition;
player setPos [_pos # 0, _pos # 1, 3000];
player allowDamage false;
player setCaptive true;
sleep 3;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust [5];
"DynamicBlur" ppEffectCommit 0;
"DynamicBlur" ppEffectAdjust [0];
"DynamicBlur" ppEffectCommit 5;
["black", true, 5] spawn BIS_fnc_blackIn;
sleep 5;
"DynamicBlur" ppEffectEnable false;

waitUntil { sleep 1; isTouchingGround player };
sleep 0.5;
player allowDamage true;
player setCaptive false;

// Display Intro text when landed
sleep 5;
private _timeString = [daytime, "HH:MM"] call BIS_fnc_timeToString;
private _handle = ["Spetsnaz group TEN-2", "Rear enemy lines", _timeString] spawn BIS_fnc_infoText;

waitUntil { sleep 1; scriptDone _handle };
"landed" call EP_fnc_showSubtitles;

// Send AI to player when near LZ
waitUntil { sleep 1; player distance2D (getMarkerPos "EP_mrkStart") < 150 };
{ _x enableAI "MOVE"; _x setCaptive false } forEach units EP_subsGroup;
private _wp = [EP_subsGroup, player, "MOVE"] call EP_fnc_addWaypoint;

// AI joins player
waitUntil { sleep 1; _wp setWaypointPosition [getPos player, -1]; (leader EP_subsGroup distance2D player) < 40 };
(units EP_subsGroup) joinSilent EP_playerGroup;
{ _x setUnitPos "AUTO" } forEach units EP_playerGroup;
_handle = "atLZ" call EP_fnc_showSubtitles;

waitUntil { sleep 1; scriptDone _handle };

// Trigger for dead team before destroying artillery vehicles
EP_trg_teamDead = [] spawn {
	while { true } do {
		private _aliveMembers = ({alive _x} count (units EP_playerGroup));
		if (_aliveMembers == 1) exitWith {
			EP_flag_teamKIA = true;
		};
		sleep 5;
	};
};

execVM "scripts\2artyBase.sqf";
