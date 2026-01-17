params ["_type", "_unit"];


switch (_type) do {
	case "SOLDIER": {
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit addWeapon "CUP_arifle_Mk16_STD_SFG";
		_unit addPrimaryWeaponItem "saber_light_ir_lxWS";
		_unit addPrimaryWeaponItem "CUP_optic_HensoldtZO_low_coyote_PIP";
		_unit addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow";

		_unit forceAddUniform "CUP_U_B_USArmy_ACU_Kneepad_Gloves_OCP";
		_unit addVest "CUP_V_B_IOTV_OCP_Rifleman_USArmy";
		_unit addBackpack "UAF_Mk4_Belt_B";

		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow";};
		for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_HandGrenade_M67";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
		_unit addHeadgear "CUP_H_USArmy_HelmetACH_OCP";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
	};
};