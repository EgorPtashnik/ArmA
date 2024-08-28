player moveInCargo [heli, 4];
// Infinite fuel for player's helicopter
[] spawn {
	while { alive heli } do { 
		heli setFuel 1;
		sleep 120;
	};
};

// setup communication menu for paratroopers
PARA_MENU = [
	["Select Group", true],
	["Call AT Squad", [2], "", -5, [["expression", "execVM 'para\para_AT_squad.sqf'"]], "1", "1", "\A3\ui_f\data\map\markers\nato\respawn_para_ca.paa"],
	["Call Rifle Squad", [3], "", -5, [["expression", "execVM 'para\para_rifle_squad.sqf'"]], "1", "1", "\A3\ui_f\data\map\markers\nato\respawn_para_ca.paa"],
	["Call Sniper Pair", [4], "", -5, [["expression", "execVM 'para\para_sniper_pair.sqf'"]], "1", "1", "\A3\ui_f\data\map\markers\nato\respawn_para_ca.paa"]
];

[player,"paradrop"] call BIS_fnc_addCommMenuItem;
