// --------------------------
// COLLATERAL DAMAGE HANDLING
// --------------------------

// Initial values
BIS_CollateralDamage = 0;               // Start with clean score
BIS_CollateralDamageCancelLimit = 14;   // Use this limit to cancel the 'Collateral Damage' task
BIS_CollateralDamageFailLimit = 42;     // Use this limit to fail the 'Collateral Damage' task

// Global EH to building partial damage/destruction
BIS_HouseDestruction = addMissionEventHandler ["BuildingChanged",
{
	params ["_from", "_to", "_isRuin"];
	
	if (time - (_from getVariable ["BIS_collateralDamage_hit", -10000]) < 1) then 
	{
		//Processing stage destruction of regular building (most likely, but not surely, caused by AAF hit)
		//Could pass the "Hit" EH also to _to, so the next stage of destruction is tallied?
		//["BuildingChanged Building: %1", _this] call BIS_fnc_Log; 
		BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_BUILDING;
	} 
	else 
	{
		//Processing collapse of wall (most likely, but not surely, caused by player)
		//Could use an actual bounding box overlap test to more accurately determine collision (since EPEContact does not work on these)?
		//Could filter some more building types, like fuel storage bladders?
		private _boundRadii = ((boundingBoxReal [_from, "Geometry"]) # 2) + (boundingBoxReal [vehicle player, "Geometry"]) # 2;
		if (((position (vehicle player)) distance _from) < _boundRadii) then 
		{
			//["BuildingChanged Wall: %1", _this] call BIS_fnc_Log; 
			BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_WALL;
		};
	};
}];

private _allStructures = BIS_trgAO_01 nearObjects ["House", 2700];
//(count _allStructures) call BIS_fnc_log;

{
	//Filter some common military buildings
	private _class = typeOf _x;
    if 
	(
        (_class find "Mil") == -1
        || (_class find "Barracks") == -1
		|| (_class find "Cargo") == -1
        || (_class find "Bunker") == -1
        || (_class find "Radar") == -1
    ) 
	then 	
	{
		private _id = _x addEventHandler ["HitPart", 
		{
			{
				private _unit = _x # 0;
				private _source = _x # 1;
				private _instigator = _x # 11;
				
				if ((_source != (vehicle _unit)) and ((faction _instigator) == "IND_F")) then 
				{
					//["Hit Building: %1", _this] call BIS_fnc_Log; 
					_unit setVariable ["BIS_collateralDamage_hit", time];
				};
			} forEach _this;
		}];
	};
} forEach _allStructures;

// List of units - do not use on BIS_ARHunter or BIS_Suspect, they are special cases
BIS_Civilians = 
[
	BIS_Car01Driver,
	BIS_Quadbike01Driver,
	BIS_Quadbike02Driver,
	BIS_Quadbike03Driver,
	BIS_Civil01,
	BIS_Civil02,
	BIS_Civil03,
	BIS_Civil04,
	BIS_Civil05,
	BIS_Civil06,
	BIS_Civil07,
	BIS_ManWhoStaresAtGoats,
	BIS_TruckDriver
];

// List of vehicles
BIS_Vehicles = 
[
	BIS_Car01,
	BIS_Car02,
	BIS_Car03,
	BIS_Car04,
	BIS_Car05,
	BIS_Car06,
	BIS_QuadBike01,
	BIS_QuadBike02,
	BIS_QuadBike03,
	BIS_Truck
];

// Units - injured
{
	private _id = _x addEventHandler ["Hit",
	{
		params ["_unit", "_source", "_damage", "_instigator"];
		
		if ((_damage > 0.2) and (_source != (vehicle _unit)) and ((faction _instigator) == "IND_F")) then 
		{
			BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_UNIT;
			//["Hit Unit: %1", _this] call BIS_fnc_Log; 
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
	}];
} forEach BIS_Civilians;

// Units - killed
{
	private _id = _x addEventHandler ["Killed",
	{
		params ["_unit", "_killer", "_instigator"];

		if ((faction _instigator) == "IND_F") then 
		{
			_killer addRating 1000;
			BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_UNIT;
			//["Killed Unit: %1", _this] call BIS_fnc_Log; 
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
	}];
} forEach BIS_Civilians;

// Vehicles - damaged
{
	private _id = _x addEventHandler ["Hit",
	{
		params ["_unit", "_source", "_damage", "_instigator"];
		
		if ((_damage > 0.2) and (_source != (vehicle _unit)) and ((faction _instigator) == "IND_F")) then 
		{
			BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_VEHICLE;
			//["Hit Vehicle: %1", _this] call BIS_fnc_Log; 
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
	}];
} forEach BIS_Vehicles;

// Vehicles - destroyed
{
	private _id = _x addEventHandler ["Killed",
	{
		params ["_unit", "_killer", "_instigator"];

		if ((faction _instigator) == "IND_F") then 
		{
			_killer addRating 1000;
			BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_VEHICLE;
			//["Killed Vehicle: %1", _this] call BIS_fnc_Log; 
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
	}];
} forEach BIS_Vehicles;
