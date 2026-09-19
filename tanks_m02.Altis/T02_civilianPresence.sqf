// Include mission defines
#include "T02_defines.inc"

// Enable dynamic simulation
(group _this) enableDynamicSimulation true;

// ---------------------------------------------
// COLLATERAL DAMAGE FOR CIVILIAN PRESENCE UNITS
// ---------------------------------------------

// Unit - injured
private _id = _this addEventHandler ["Hit",
{
	params ["_unit", "_source", "_damage", "_instigator"];

	if ((_damage > 0.2) and (_source != (vehicle _unit)) and ((faction _instigator) == "IND_F")) then 
	{
		BIS_CollateralDamage = BIS_CollateralDamage + PENALTY_UNIT;
		//["Hit Unit: %1", _this] call BIS_fnc_Log; 
		_unit removeEventHandler [_thisEvent, _thisEventHandler];
	};
}];

// Unit - killed
private _id = _this addEventHandler ["Killed",
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
