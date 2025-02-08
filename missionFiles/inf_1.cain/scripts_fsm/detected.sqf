{_x hideObject false; _x enableSimulation true;} forEach units grpReinf;
ural hideObject false;
ural enableSimulation true;

// Wait 3 minutes and then send reinforces
private _handle = ["detected-1"] call fnc_comms;
waitUntil {scriptDone _handle};
_handle = ["detected-2"] call fnc_comms;
waitUntil {scriptDone _handle};
_handle = ["detected-3"] call fnc_comms;
waitUntil {scriptDone _handle};


grp_redPatrol call CBA_fnc_clearWaypoints;
[	grp_redPatrol,
	position player,
	-1,
	"SAD",
	"COMBAT",
	"RED",
	"FULL"] call CBA_fnc_addWaypoint;

sleep 360;


sleep 5;

private _wp = [	
	grpReinf,
	ural,
	-1,
	"GETIN",
	"AWARE",
	"YELLOW",
	"FULL"] call CBA_fnc_addWaypoint;
_wp waypointAttachVehicle ural;

waitUntil {
	sleep 1;
	{_x in ural} count units grpReinf == count units grpReinf;
};

[	grpReinf,
	[6992.63,5962.19,0],
	-1,
	"GETOUT",
	"COMBAT",
	"RED"] call CBA_fnc_addWaypoint;

[	grpReinf,
	[7096.97,5988.38,0],
	-1,
	"SAD"] call CBA_fnc_addWaypoint;
