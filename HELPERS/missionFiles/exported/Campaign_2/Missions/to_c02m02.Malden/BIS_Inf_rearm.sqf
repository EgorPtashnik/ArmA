{
removeAllWeapons _x;
removeUniform _x;
removeVest _x;
removeBackpack _x;
removeHeadgear _x;
removeGoggles _x;
_x removeItem "NVGoggles";
_x unassignItem "NVGoggles";

} forEach units BIS_Alpha;

_alphaMG  = units BIS_Alpha select 1;
_alphaHMG = units BIS_Alpha select 2;
_alphaMedik = units BIS_Alpha select 3;
_alphaAT = units BIS_Alpha select 4;
_alphaGrenadier = units BIS_Alpha select 5;
_alphaMark = units BIS_Alpha select 6;


// Player
comment "Add containers";
player setRank "SERGEANT";
player forceAddUniform "U_B_CombatUniform_mcam_vest";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_black_mag";};
player addVest "V_PlateCarrierGL_rgr";
for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 7 do {player addItemToVest "30Rnd_65x39_caseless_black_mag";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
player addHeadgear "H_HelmetB_light_grass";

comment "Add weapons";
player addWeapon "arifle_MX_GL_Black_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Hamr";
player addWeapon "hgun_P07_F";
player addWeapon "Binocular";

// Grenadier
comment "Add containers";
_alphaGrenadier setRank "CORPORAL";
_alphaGrenadier forceAddUniform "U_B_CombatUniform_mcam";
_alphaGrenadier addItemToUniform "FirstAidKit";
_alphaGrenadier addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_alphaGrenadier addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_alphaGrenadier addVest "V_PlateCarrierGL_rgr";
for "_i" from 1 to 2 do {_alphaGrenadier addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 4 do {_alphaGrenadier addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_alphaGrenadier addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_alphaGrenadier addItemToVest "MiniGrenade";};
_alphaGrenadier addItemToVest "SmokeShell";
_alphaGrenadier addItemToVest "SmokeShellGreen";
_alphaGrenadier addItemToVest "Chemlight_green";
for "_i" from 1 to 2 do {_alphaGrenadier addItemToVest "1Rnd_Smoke_Grenade_shell";};
_alphaGrenadier addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
_alphaGrenadier addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
_alphaGrenadier addItemToVest "1Rnd_SmokeOrange_Grenade_shell";
_alphaGrenadier addItemToVest "30Rnd_65x39_caseless_black_mag";
_alphaGrenadier addHeadgear "H_HelmetSpecB_blk";

comment "Add weapons";
_alphaGrenadier addWeapon "arifle_MX_GL_Black_F";
_alphaGrenadier addPrimaryWeaponItem "optic_Aco";
_alphaGrenadier addWeapon "hgun_P07_F";

//AT Soldier
comment "Add containers";
_alphaAT forceAddUniform "U_B_CombatUniform_mcam";
_alphaAT addItemToUniform "FirstAidKit";
_alphaAT addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_alphaAT addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_alphaAT addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 2 do {_alphaAT addItemToVest "16Rnd_9x21_Mag";};
_alphaAT addItemToVest "SmokeShell";
_alphaAT addItemToVest "SmokeShellGreen";
_alphaAT addItemToVest "Chemlight_green";
_alphaAT addItemToVest "30Rnd_65x39_caseless_black_mag";
_alphaAT addBackpack "B_AssaultPack_mcamo_AT";
_alphaAT addItemToBackpack "Titan_AT";
_alphaAT addHeadgear "H_HelmetB_light_desert";

comment "Add weapons";
_alphaAT addWeapon "arifle_MXC_Black_F";
_alphaAT addPrimaryWeaponItem "acc_pointer_IR";
_alphaAT addPrimaryWeaponItem "optic_Holosight";
_alphaAT addWeapon "launch_B_Titan_short_F";
_alphaAT addSecondaryWeaponItem "acc_pointer_IR";
_alphaAT addWeapon "hgun_P07_F";

//HMG gunner
comment "Add containers";
_alphaHMG forceAddUniform "U_B_CombatUniform_mcam";
_alphaHMG addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_alphaHMG addItemToUniform "16Rnd_9x21_Mag";};
_alphaHMG addItemToUniform "SmokeShell";
_alphaHMG addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 2 do {_alphaHMG addItemToUniform "Chemlight_green";};
_alphaHMG addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 2 do {_alphaHMG addItemToVest "130Rnd_338_Mag";};
_alphaHMG addBackpack "B_FieldPack_cbr";
_alphaHMG addItemToBackpack "130Rnd_338_Mag";
_alphaHMG addHeadgear "H_HelmetB";

comment "Add weapons";
_alphaHMG addWeapon "MMG_02_black_F";
_alphaHMG addPrimaryWeaponItem "acc_pointer_IR";
_alphaHMG addPrimaryWeaponItem "optic_Hamr";
_alphaHMG addPrimaryWeaponItem "bipod_01_F_blk";
_alphaHMG addWeapon "hgun_P07_F";

// střelec
comment "Add containers";
_alphaMark setRank "CORPORAL";
_alphaMark forceAddUniform "U_B_CombatUniform_mcam_tshirt";
_alphaMark addItemToUniform "FirstAidKit";
_alphaMark addItemToUniform "HandGrenade";
_alphaMark addItemToUniform "SmokeShell";
_alphaMark addItemToUniform "SmokeShellGreen";
_alphaMark addItemToUniform "Chemlight_green";
_alphaMark addVest "V_PlateCarrier2_rgr";
for "_i" from 1 to 2 do {_alphaMark addItemToVest "16Rnd_9x21_Mag";};
_alphaMark addItemToVest "Chemlight_green";
for "_i" from 1 to 3 do {_alphaMark addItemToVest "100Rnd_65x39_caseless_mag";};
_alphaMark addHeadgear "H_HelmetB_grass";

comment "Add weapons";
_alphaMark addWeapon "arifle_MX_SW_Black_F";
_alphaMark addPrimaryWeaponItem "acc_pointer_IR";
_alphaMark addPrimaryWeaponItem "optic_Aco";
_alphaMark addPrimaryWeaponItem "bipod_01_F_blk";
_alphaMark addWeapon "hgun_P07_F";

// kulometčík
comment "Add containers";
_alphaMG forceAddUniform "U_B_CombatUniform_mcam";
_alphaMG addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_alphaMG addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_alphaMG addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 2 do {_alphaMG addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_alphaMG addItemToVest "HandGrenade";};
_alphaMG addItemToVest "SmokeShell";
_alphaMG addItemToVest "SmokeShellGreen";
_alphaMG addItemToVest "Chemlight_green";
_alphaMG addItemToVest "30Rnd_65x39_caseless_black_mag";
_alphaMG addHeadgear "H_HelmetB_grass";

comment "Add weapons";
_alphaMG addWeapon "arifle_MXM_Black_F";
_alphaMG addPrimaryWeaponItem "acc_pointer_IR";
_alphaMG addPrimaryWeaponItem "optic_Hamr";
_alphaMG addPrimaryWeaponItem "bipod_01_F_blk";
_alphaMG addWeapon "hgun_P07_F";

//Medik
comment "Add containers";
_alphaMedik setRank "CORPORAL";
_alphaMedik forceAddUniform "U_B_CombatUniform_mcam_tshirt";
_alphaMedik addItemToUniform "FirstAidKit";
_alphaMedik addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_alphaMedik addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_alphaMedik addVest "V_PlateCarrierSpec_rgr";
for "_i" from 1 to 2 do {_alphaMedik addItemToVest "16Rnd_9x21_Mag";};
_alphaMedik addItemToVest "SmokeShell";
_alphaMedik addItemToVest "SmokeShellGreen";
_alphaMedik addItemToVest "SmokeShellBlue";
_alphaMedik addItemToVest "SmokeShellOrange";
_alphaMedik addItemToVest "Chemlight_green";
_alphaMedik addItemToVest "30Rnd_65x39_caseless_black_mag";
_alphaMedik addBackpack "B_AssaultPack_rgr_Medic";
_alphaMedik addItemToBackpack "Medikit";
for "_i" from 1 to 10 do {_alphaMedik addItemToBackpack "FirstAidKit";};
_alphaMedik addHeadgear "H_HelmetB_light_black";

comment "Add weapons";
_alphaMedik addWeapon "arifle_MX_Black_F";
_alphaMedik addPrimaryWeaponItem "acc_pointer_IR";
_alphaMedik addWeapon "hgun_P07_F";
