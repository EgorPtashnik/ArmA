[_stateMachine, "init", "beach", { time > 0 }, {
	[grp_player, getPos wp_player_1] call CBA_fnc_addWaypoint;
	[grp_player, getPos wp_player_2, -1, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "grp_player leaveVehicle u_boat"] call CBA_fnc_addWaypoint;
	private _wp = [grp_player, getPos wp_player_3] call CBA_fnc_addWaypoint;
	_wp setWaypointStatements ["true", "missionNamespace setVariable ['beachCeased', true]"];

	// Trigger to allow animation for beach defence
	[] spawn {
		waitUntil {
			sleep 1;
			combatBehaviour grp_player == "COMBAT" || combatBehaviour grp_beachMain == "COMBAT";
		};
		{  _x enableAI "ALL"; _x switchMove ""; } forEach (units grp_beachMain);
		[grp_beachMain] call CBA_fnc_taskDefend;
	};
}] call fn_fsmAddTransition;