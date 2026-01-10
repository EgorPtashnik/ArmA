{
	removeAllWeapons _x;
	removeAllItems _x;
	removeAllAssignedItems _x;
	removeUniform _x;
	removeVest _x;
	removeBackpack _x;
	removeHeadgear _x;
	removeGoggles _x;
	_x addWeapon "CUP_arifle_L85A2_G";
	_x addPrimaryWeaponItem "CUP_muzzle_snds_L85";
	_x addPrimaryWeaponItem "CUP_optic_Elcan_reflex";
	_x addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag_L85";
	_x addWeapon "CUP_hgun_Glock17_blk";
	_x addHandgunItem "CUP_17Rnd_9x19_glock17";
	_x forceAddUniform "CUP_U_B_BAF_MTP_UBACSROLLEDKNEE";
	_x addVest "CUP_V_B_BAF_MTP_Osprey_Mk4_Rifleman";
	_x addItemToUniform "FirstAidKit";
	_x addItemToUniform "FirstAidKit";
	_x addHeadgear "CUP_H_BAF_MTP_Mk7";
	for "_i" from 1 to 2 do {_x addItemToUniform "CUP_17Rnd_9x19_glock17";};
	_x addItemToUniform "SmokeShell";
	for "_i" from 1 to 3 do {_x addItemToVest "CUP_HandGrenade_L109A2_HE";};
	_x addItemToVest "B_IR_Grenade";
	_x addItemToVest "SmokeShell";
	for "_i" from 1 to 3 do {_x addItemToVest "CUP_30Rnd_556x45_Stanag_L85";};

	// Condition for loadout
	if (_x getVariable ["EP_AT", false]) then {
		_x addWeapon "CUP_launch_NLAW";
	} else {
		_x addBackpack "CUP_B_Motherlode_Radio_MTP";
		for "_i" from 1 to 3 do {_x addItemToBackpack "CUP_30Rnd_556x45_Stanag_L85";};
	};
	
	_x linkItem "ItemMap";
	_x linkItem "ItemCompass";
	_x linkItem "ItemWatch";
	_x linkItem "ItemRadio";
	_x linkItem "ItemGPS";
} forEach _this;