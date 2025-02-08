//
// General persistence variables
//
// Surviving characters: Medic, Pilot
BIS_to_medicAlive = false;
BIS_to_pilotAlive = false;
if (!isNULL BIS_pilot && {alive BIS_pilot} && {!isNil "BIS_pilotRescued"}) then {BIS_to_pilotAlive = true};
if (!isNULL BIS_medic && {alive BIS_medic} && {!isNil "BIS_helpedMedic"}) then {BIS_to_medicAlive = true};

// Calculate losses
BIS_to_m1_nDead_NATO = BIS_to_m1_nDead_NATO + 30; // 30 people killed "outside mission"
BIS_to_m1_nDead_AAF = BIS_to_m1_nDead_AAF + 20; // 20 people killed "outside mission"
// Also BIS_to_m1_nDead_CSAT is counted 

BIS_to_nInjured = 4;
if (BIS_to_medicAlive) then {
	BIS_to_nInjured = 6;
};

private _nlocalSurvivors = count ((BIS_regroup nearEntities ["Man", 300]) select {side _x == WEST});
private _medicHelp = 2;
private _nReconsAlive = 4;
if (isNil "BIS_reconSucceeded" || {!BIS_reconSucceeded}) then {
	_reconsAlive = 2;
};

BIS_to_nSurvivors = _nlocalSurvivors + _medicHelp + _nReconsAlive;
debugLog str ["BIS_to_nSurvivors: ",_medicHelp,_nReconsAlive,_nlocalSurvivors];

// Player inventory
BIS_to_playerInventory = getUnitLoadout player;

// Mission date
BIS_to_missionDate = date; // this is for setting mission date exactly to certain time

// MortarSaved
if (isNil "BIS_to_mortarSaved") then {
	BIS_to_mortarSaved = false;
};

//
// Mission 1 specific persistence variables
//

// Store equipment in the area
BIS_to_equipment = [];
private _ammoCrates = nearestObjects [BIS_regroup, ["ReammoBox_F","Car"], 150];
{
	// Format to save box: Type, pos, dir, equipment
	private _array = [typeOf _x, getPos _x, getDir _x, getMagazineCargo _x, getWeaponCargo _x, getItemCargo _x];
	BIS_to_equipment pushBack _array;
} forEach (_ammoCrates select {alive _x});

// List of all variables to save
private _varsToSave = [
	"BIS_to_m1_nDead_NATO",
	"BIS_to_m1_nDead_AAF",
	"BIS_to_m1_nDead_CSAT",
	"BIS_to_nSurvivors",
	"BIS_to_nInjured",
	"BIS_to_missionDate",
	"BIS_to_medicAlive",
	"BIS_to_pilotAlive",
	"BIS_to_playerInventory",
	"BIS_to_mortarSaved",
	"BIS_to_equipment"
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