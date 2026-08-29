//Set Player Squad Equipment
_aafplsquad = units pl1;

//Reaction Forces Compat Equipment
if ( (isClass (configfile >> "CfgPatches" >> "RF_Data")) ) then
{

	if ( (isClass (configfile >> "CfgPatches" >> "A3_Aegis_Characters_F_Aegis")) ) then
	{
		pl3 addGoggles "G_Balaclava_blk_lxWS";
		pl2 addUniform "U_I_Uniform_01_tanktop_F";
		pl3 addUniform "Aegis_U_I_Uniform_01_sweater_f";
		pl2 addItem "FirstAidKit";
	};
	pl1 removeWeapon "arifle_Katiba_F";
	pl2 removeWeapon "arifle_Katiba_GL_F";
	pl3 removeWeapon "arifle_Katiba_F";
	pl4 removeWeapon "srifle_EBR_MRCO_LP_BI_F";
	{
		_x removeMagazines "20Rnd_762x51_Mag";
		_x removeMagazines "30Rnd_65x39_caseless_green";
		_x addMagazines ["30Rnd_556x45_AP_Stanag_RF", 11];
	}forEach _aafplsquad;
	pl1 addWeapon "arifle_Mk20_MRCO_F";
	pl2 addWeapon "arifle_Mk20_GL_MRCO_pointer_F";
	pl3 addWeapon "arifle_Mk20_MRCO_F";
	pl4 addWeapon "srifle_h6_oli_vrco_snd_RF";
	pl4 addPrimaryWeaponItem "optic_tws";
	{
		_x addPrimaryWeaponItem "muzzle_snds_M";
	}forEach _aafplsquad;
	pl1 switchMove "AmovPercMstpSlowWrflDnon";
	pl1 addItem "FirstAidKit";
}
else
{
};

{
	[_x, "AAF_1stRegiment"] call BIS_fnc_setUnitInsignia;
}forEach _aafplsquad;