sleep 1;

if (isNil "BIS_to_playerInventory") exitWith {
	["Persistence failed!"] call BIS_fnc_error;
	BIS_to_m2_nDead_NATO = 0;
	BIS_to_m2_nDead_CSAT = 0;
	BIS_to_m2_nDead_AAF = 0;
};

BIS_to_m2_nDead_NATO = BIS_to_m1_nDead_NATO;
BIS_to_m2_nDead_CSAT = BIS_to_m1_nDead_CSAT;
BIS_to_m2_nDead_AAF = BIS_to_m1_nDead_AAF;

//
// General persistence variables
//

// Calculate losses
private _attackGroups = [BIS_groupNovember,BIS_groupOscar,BIS_groupRomeo];
private _deleteQueue = [];
// have last soldier who is not player part of this 
for "_i" from 1 to 5 do {
	{
		private _unit = (units _x) select (count units _x - _i); 
		if (_unit != player) then {
			_deleteQueue pushBack _unit;
		};
	} forEach _attackGroups;
};

// According to killed units and other factors, find how many soldiers to delete
private _maxDead = 8;
private _numDead = round (BIS_to_nSurvivors / 2);

if (_numDead > _maxDead) then {_numDead = _maxDead};

for "_i" from 0 to (_numDead - 1) do {
	deleteVehicle (_deleteQueue select _i);
};

// Adjust wounded - if you saved medic, have 2 more wounded that survived
if(!BIS_to_medicAlive) then 
{
	deleteVehicle BIS_wounded_1;
	deleteVehicle BIS_wounded_2;
};

// Player inventory
player setUnitLoadout BIS_to_playerInventory;

// Mission date
//BIS_to_missionDate set [4, (BIS_to_missionDate select 4) + 20];
setDate BIS_to_missionDate;
skipTime 0.2;

// MortarSaved
if (backpack player == "B_mortar_01_weapon_F" && BIS_to_mortarSaved) then {
	removeBackpack player;
	player addItemToBackpack "toolKit";
};
if (backpack player == "") then {
	player addBackpack "B_Kitbag_mcamo";
	player addItemToBackpack "toolKit";
};

//
// Mission 1 specific persistence variables
//

// Surviving characters: Medic, Pilot
if (!BIS_to_pilotAlive) then {deleteVehicle BIS_pilot};
if (!BIS_to_medicAlive) then {deleteVehicle BIS_medic};

/*
// Store equipment in the area
{
	_x params ["_classname","_pos","_dir","_mags","_weapons","_items"];
	private _crate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
	_crate setDir _dir;

	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
	clearItemCargo _crate;

	{_crate addMagazineCargo _x} forEach _mags;
	{_crate addWeaponCargo _x} forEach _weapons;
	{_crate addItemCargo _x} forEach _items;
} forEach BIS_to_equipment;
*/

// Debug
private _loadedVars = [
	"BIS_to_m1_nDead_NATO",
	"BIS_to_m1_nDead_AAF",
	"BIS_to_m1_nDead_CSAT",
	"BIS_to_nSurvivors",
	"BIS_to_nInjured",
	"BIS_to_missionDate",
	"BIS_to_medicAlive",
	"BIS_to_pilotAlive",
	"BIS_to_mortarSaved",
	"BIS_to_playerInventory",
	"BIS_to_equipment"
];

private _debugString = "";
{
	private _str = format ["%1: %2\n",_x, missionNamespace getVariable _x];
	_debugString = _debugString + _str;
} forEach _loadedVars; 

// Debug hint + debugLog
//hint _debugString;
debugLog _debugString;
