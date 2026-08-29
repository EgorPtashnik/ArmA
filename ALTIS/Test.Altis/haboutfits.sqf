//USMC HAB
_usmchabengi = [hab_engi1,hab_engi2,hab_engi3];
{
	removeAllWeapons _x;
	//removeAllMagazines _x;
	removeAllItems _x;
	removeAllAssignedItems _x;
	removeBackpack _x;
	_x addVest "V_Safety_yellow_F";
	_x addHeadgear "H_EarProtectors_yellow_F";
	_x addMagazines ["16Rnd_9x21_Mag", 3];
	_x addWeapon "ef_hgun_P07_coy";
}forEach _usmchabengi;

_usmchabcorpsman = [hab_corpsman1,hab_corpsman2,hab_corpsman3];
{
	removeAllWeapons _x;
	//removeAllMagazines _x;
	removeAllItems _x;
	removeAllAssignedItems _x;
	removeBackpack _x;
	removeHeadgear _x;
	_x addVest "V_Plain_crystal_F";
	_x addGoggles "G_Respirator_white_F";
	_x addMagazines ["16Rnd_9x21_Mag", 3];
	_x addWeapon "ef_hgun_P07_coy";
}forEach _usmchabcorpsman;