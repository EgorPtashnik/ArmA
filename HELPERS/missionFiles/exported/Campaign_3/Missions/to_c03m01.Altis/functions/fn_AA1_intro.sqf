// ---------------------
// Scripts setting up intro phase of the mission
// ---------------------
// Important variables
private _allWestUnits = allUnits select {side _x == WEST};
BIS_allAA = [BIS_gorgon, BIS_mora, BIS_AA, BIS_AA_1];
player addRating 2000;

// Custom setup for all vehicles in the intro
BIS_AA removeMagazinesTurret ["4Rnd_Titan_long_missiles",[0]];
BIS_AA_1 removeMagazinesTurret ["4Rnd_Titan_long_missiles",[0]];

/*
{
	_x setCaptive true;
} forEach _allWestUnits;
*/


[BIS_supply_1] call BIS_fnc_AA1_parachute;

// blufor artillery support at the start
[] spawn {
	for "_i" from 1 to 2 do
	{
		BIS_arty_2 doArtilleryFire [getPos BIS_flarePos_2, "12Rnd_230mm_rockets", 8];
		BIS_arty_2 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		//BIS_arty_3 doArtilleryFire [getPos BIS_artyPos_4, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		sleep 10;

		BIS_arty_2 doArtilleryFire [getPos BIS_artyPos_6, "12Rnd_230mm_rockets", 8];
		BIS_arty_2 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		//BIS_arty_3 doArtilleryFire [getPos BIS_flarePos_2, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		sleep 10;

		sleep 120;

		BIS_arty_2 doArtilleryFire [getPos BIS_artyPos_4, "12Rnd_230mm_rockets", 8];
		BIS_arty_2 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		//BIS_arty_3 doArtilleryFire [getPos BIS_artyPos_6, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		sleep 20;

		BIS_arty_2 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		BIS_arty_2 doArtilleryFire [getPos BIS_artyPos_2, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 doArtilleryFire [getPos BIS_artyPos_5, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		sleep 20;

		BIS_arty_2 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		BIS_arty_2 doArtilleryFire [getPos BIS_artyPos_5, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 doArtilleryFire [getPos BIS_artyPos_2, "12Rnd_230mm_rockets", 8];
		//BIS_arty_3 addMagazineTurret ["12Rnd_230mm_rockets",[-1]];
		sleep 20;
	};
	{deleteVehicle _x} forEach (["Artillery 2"] call BIS_fnc_to_unitList);
};

// Reveal VTOLS for AA
{
	_unit = _x;
	{
		_unit reveal [_x, 4];
	} forEach BIS_vtols;
} forEach BIS_allAA;

//{_x setCaptive false} forEach _allWestUnits;

BIS_heli_4 allowDamage false;
BIS_heli_5 allowDamage true;
BIS_heli_7 allowDamage false;

[] spawn {
	sleep 10;
	BIS_heli_5 enableSimulation true;
	{_x enableSimulation true} forEach crew BIS_heli_5;
};

[] spawn {
	sleep 40;
	{
		if (vehicle _x == _x) then {
			_x setDamage 1; 
		};
	} forEach (crew BIS_heli_4 + crew BIS_heli_5 + crew BIS_heli_7);
};

sleep 15;

// Delete paratroopers after they land
{
	_x spawn {
		waitUntil {sleep 1; (getPos _this) select 2 < 2};
		deleteVehicle _this;
	}
} forEach (["Paratroopers"] call BIS_fnc_to_unitList);

/*
// Prepare ambient combat: Flares, firefights, artillery strikes
[] spawn {
	private _flarePositions = [BIS_flarePos_1, BIS_flarePos_2, BIS_flarePos_3, BIS_flarePos_4];
	sleep 50;
	{
		["AMBIENT: Flares spawned"] call bis_fnc_log;
		[_x] call BIS_fnc_aa1_fireFlare;
		sleep 90 + random 30;
		deleteVehicle _x;
	} forEach _flarePositions;
};
*/

[] spawn {

	_positions = 
	[
		BIS_AmbientSpawn1,
		BIS_AmbientSpawn2,
		BIS_AmbientSpawn3,
		BIS_AmbientSpawn4,
		BIS_AmbientSpawn5,
		BIS_AmbientSpawn6
	];

	{
		0 = [_x, 300] spawn BIS_fnc_TO_ambientFirefight;
		if (_forEachIndex > 2) then {sleep 300};
	} 
	forEach _positions;
};
private _artilleryPositions = [BIS_artyPos_1, BIS_artyPos_2, BIS_artyPos_3, BIS_artyPos_4, BIS_artyPos_5, BIS_artyPos_6, BIS_artyPos_7];
{
	["AMBIENT: Arty started"] call bis_fnc_log;
	BIS_arty doArtilleryFire[getPos _x, "32Rnd_155mm_Mo_shells", 4];
	BIS_arty addMagazineTurret ["32Rnd_155mm_Mo_shells",[-1]];

	sleep 45 + (random 50);
} forEach _artilleryPositions; 
deleteVehicle BIS_arty;
{deleteVehicle _x} forEach _artilleryPositions;
