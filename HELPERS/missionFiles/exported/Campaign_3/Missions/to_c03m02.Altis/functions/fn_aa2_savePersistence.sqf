//
// General persistence variables
//

// Calculate losses
// All losses are counted in 

// Calculate how many troops and wounded reached Stallion
BIS_to_nSurvivors_2 = {alive _x} count BIS_bluforUnits;
BIS_to_nInjured_2 = {alive _x} count ((getMissionLayerEntities "Wounded" select 0) select {!(_x isKindOf "B_medic_F")});

// Player inventory + APC 
BIS_to_playerInventory_2 = getUnitLoadout player;
// Save state of APC - will be saved as player if APC is not there
if (!alive BIS_apc || isNull BIS_apc) then {
	BIS_apc = vehicle player;
};
BIS_to_apcState_2 = [typeOf BIS_apc, damage BIS_apc];

// Mission date
BIS_to_missionDate_2 = date; // this is for setting mission date exactly to certain time

// MortarSaved
BIS_to_mortarSaved_2 = false;
if (backpack player == "B_mortar_01_weapon_F" ||
	{"B_mortar_01_weapon_F" in (getBackpackCargo BIS_apc)} ||
	//{"B_mortar_01_weapon_F" in (getBackpackCargo BIS_box_1)} ||
	//{"B_mortar_01_weapon_F" in (getBackpackCargo BIS_box_2)} ||
	{"B_mortar_01_weapon_F" == backpack player}
) then {
	BIS_to_mortarSaved_2 = true;
};

//
// Mission 2 specific persistence variables
//

// Surviving characters: Medic, Pilot, Oscar Leader
BIS_to_medicAlive_2 = false;
BIS_to_pilotAlive_2 = false;
BIS_to_oscarAlive_2 = false;
if (isNil "BIS_to_injuredCaptured") then {
	BIS_to_injuredCaptured = true;
};
if (!isNULL BIS_pilot && {alive BIS_pilot} && {!BIS_to_injuredCaptured}) then {BIS_to_pilotAlive_2 = true};
if (!isNULL BIS_medic && {alive BIS_medic} && {!BIS_to_injuredCaptured}) then {BIS_to_medicAlive_2 = true};
if (!isNULL BIS_oscar && {alive BIS_oscar}) then {BIS_to_oscarAlive_2 = true};

// Debug
// List of all variables to save
private _varsToSave = [
	"BIS_to_m2_nDead_NATO",
	"BIS_to_m2_nDead_AAF",
	"BIS_to_m2_nDead_CSAT",
	"BIS_to_nSurvivors_2",
	"BIS_to_nInjured_2",
	"BIS_to_missionDate_2",
	"BIS_to_medicAlive_2",
	"BIS_to_pilotAlive_2",
	"BIS_to_oscarAlive_2",
	"BIS_to_injuredCaptured",
	"BIS_to_mortarSaved_2",
	"BIS_to_apcState_2",
	"BIS_to_playerInventory_2"
];

private _debugString = "";
{
	private _str = format ["%1: %2\n",_x, missionNamespace getVariable _x];
	_debugString = _debugString + _str;
	saveVar _x;
} forEach _varsToSave; 

// Debug hint + debugLog
//hint _debugString;
debugLog _debugString;
