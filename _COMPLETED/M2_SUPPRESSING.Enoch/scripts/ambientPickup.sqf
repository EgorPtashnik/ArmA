private _grp = group EP_ambPickup;

[_grp, false] call EP_fnc_showObjects;

while { true } do {
	// Player near pickup
	if ( (player distance2D EP_ambPickup) <= 200 ) exitWith {
		[_grp, true] call EP_fnc_showObjects;
		EP_ambPickup limitSpeed 40;
		[_grp, "EP_mrkAmbPickupWp", "SAFE", [
			{ true },
			{
				{ EP_ambPickup deleteVehicleCrew _x } forEach crew EP_ambPickup;
				deleteVehicle EP_ambPickup;
				deleteGroup group EP_ambPickup;
			}
		]] call EP_fnc_addWaypoint;
	};

	// Close loop if group is dead
	if ( (units _grp findIf { alive _x }) == -1 ) exitWith { deleteGroup _grp };

	sleep 5;
};
