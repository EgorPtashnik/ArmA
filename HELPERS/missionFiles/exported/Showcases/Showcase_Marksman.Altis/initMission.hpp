// Always start a mission with this
        {_x allowFleeing 0} forEach allUnits;

// Fog
        0 setFog [0.05,0.05,25];

// Loadout for player
        // _null = [BIS_Player,"Cyrus"] execVM "Scripts\Loadout.sqf";

        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeUniform player;
        removeVest player;
        removeBackpack player;
        removeHeadgear player;
        removeGoggles player;

	player forceAddUniform "U_O_SpecopsUniform_ocamo";
	player addItemToUniform "FirstAidKit";
        for "_i" from 1 to 2 do {player addItemToUniform "Chemlight_red";};
        for "_i" from 1 to 4 do {player addItemToUniform "16Rnd_9x21_Mag";};
        player addVest "V_HarnessOSpec_brn";
        for "_i" from 1 to 5 do {player addItemToVest "10Rnd_93x64_DMR_05_Mag";};
        for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
        player addItemToVest "SmokeShell";
        player addItemToVest "SmokeShellRed";
        player addHeadgear "H_HelmetO_ocamo";
        player addGoggles "G_Bandanna_beast";

        player addWeapon "srifle_DMR_05_hex_F";
        player addPrimaryWeaponItem "muzzle_snds_93mmg";
        player addPrimaryWeaponItem "optic_khs_hex";
        player addPrimaryWeaponItem "acc_pointer_IR";
        player addPrimaryWeaponItem "bipod_02_F_hex";
        player addWeapon "hgun_Rook40_snds_F";
        player addWeapon "Rangefinder";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "ItemRadio";
        player linkItem "ItemGPS";
        player linkItem "NVGoggles_OPFOR";

        [player,"GryffinRegiment"] call bis_fnc_setUnitInsignia;

// Player using stealth protocol
        (group player) setBehaviour "Stealth";

// Flying sequences
        Flight01 = call compile preprocessFileLineNumbers "Scripts\Flight01.sqf";
        Flight02 = call compile preprocessFileLineNumbers "Scripts\Flight02.sqf";
        Flight03 = call compile preprocessFileLineNumbers "Scripts\Flight03.sqf";

// Taru cargo
        clearMagazineCargo BIS_Taru;
        clearWeaponCargo BIS_Taru;
        clearItemCargo BIS_Taru;
        clearBackpackCargo BIS_Taru;

// FIA Box. What's in the box?
        {clearMagazineCargo _x; clearWeaponCargo _x; clearItemCargo _x; clearBackpackCargo _x} forEach [BIS_FIA_Box];
        BIS_FIA_Box addWeaponCargo ["srifle_DMR_06_camo_F",1];
        BIS_FIA_Box addMagazineCargo ["20Rnd_762x51_Mag",7];
        BIS_FIA_Box addMagazineCargo ["200Rnd_65x39_cased_Box",3];
        BIS_FIA_Box addMagazineCargo ["30Rnd_556x45_Stanag",16];
        BIS_FIA_Box addMagazineCargo ["HandGrenade",4];
        BIS_FIA_Box addMagazineCargo ["SmokeShell",2];
        BIS_FIA_Box addMagazineCargo ["Chemlight_blue",9];
        BIS_FIA_Box addItemCargo ["FirstAidKit",7];
        BIS_FIA_Box addItemCargo ["acc_flashlight",3];
        BIS_FIA_Box addItemCargo ["optic_MRCO",1];
        BIS_FIA_Box addBackpackCargo ["B_FieldPack_khk",1];

// Hide doors on Orca
        BIS_Taru animate ["dvere1_hide", 1]; 
        BIS_Taru animate ["dvere2_hide", 1];

// Units at first FIA base
        BIS_VillaUnits = [BIS_FIA_A1,BIS_FIA_A2,BIS_FIA_A3,BIS_FIA_A4,BIS_FIA_A5];

// Units at second FIA base
        BIS_LZUnits = [BIS_FIA_B1,BIS_FIA_B2,BIS_FIA_B3,BIS_FIA_B4,BIS_FIA_B5];

// Groups at third FIA base
        BIS_CampGroups = [BIS_grpFIA01,BIS_grpFIA02,BIS_grpFIA03,BIS_grpFIA04,BIS_grpFIA05,BIS_grpFIA06,BIS_grpFIA07];

//Title card
["\a3\Missions_F_Mark\video\Marksman.ogv","STR_A3_Showcase_Marksman_titlecard"] spawn BIS_fnc_titlecard;
waitUntil { !isNil { BIS_fnc_titlecard_finished } };

// Start establishing shot

[
	[9079.87,7729.96,0],					// Target position
	localize "STR_A3_Showcase_Marksman_SITREP_text",        // SITREP text
	750,							// 750m altitude
	100,							// 100m radius
	0,							// 0 degrees viewing angle
	1,							// Clockwise movement
	
	[]

] spawn BIS_fnc_establishingShot;
