private _handle = nil;

{ _x enableSimulation true; _x hideObject false; _x allowDamage true; _x setCaptive false } forEach (getMissionLayerEntities "town_ally_attackers" # 0);
a_town_apc_1 addEventHandler ["Killed", { "lostStryker_1" spawn ep_fnc_showSubtitles; }];
a_town_apc_2 addEventHandler ["Killed", { "lostStryker_2" spawn ep_fnc_showSubtitles; }];

{ [_x, "m_town", "AWARE", "RED", "FULL"] call ep_fnc_taskAttack } forEach [a_grp_inf_1, a_grp_inf_2];
{
	_x limitSpeed 30;
	[_x, "m_town"] call ep_fnc_taskAttack
} forEach  [a_town_apc_1, a_town_apc_2];

sleep 3;

savegame;

playMusic "LeadTrack03_F_Jets";

//=====================================LOOP=====================================//
private _aUnits = (units a_grp_inf_1) + (units a_grp_inf_2) + [a_town_apc_1, a_town_apc_2];
private _eUnits = allUnits select { side _x == independent };
private _eUnitsCount = count _eUnits;


while { true } do {

	// END - Town captured
	if (({ alive _x } count _eUnits) < (_eUnitsCount* 0.17)) exitWith {
		_handle = "town_siezed" call ep_fnc_showSubtitles;


		waitUntil { sleep 1; scriptDone _handle };
		["taskSupport", "SUCCEEDED"] call ep_fnc_missionTasks;
		sleep 3;
		"Win" call BIS_fnc_endMission;
	};

	// END - Casualties
	if (({ alive _x} count _aUnits) < 6) exitWith {
		_handle = "town_casualties" call ep_fnc_showSubtitles;
		waitUntil { sleep 1; scriptDone _handle };
		["taskSupport", "FAILED"] call ep_fnc_missionTasks;
		sleep 3;

		["Fail", false] call BIS_fnc_endMission;
	};

	sleep 1;
};