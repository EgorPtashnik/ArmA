removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;


_this forceAddUniform selectRandom ["U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerrilla_6_1","U_OG_leader","U_OG_leader","U_lxWS_SFIA_deserter"];
_this addVest selectRandom ["V_TacVest_oli","V_TacVest_camo","V_BandollierB_oli","V_Chestrig_oli","V_TacChestrig_grn_F","V_SmershVest_01_F","V_lxWS_TacVestIR_oli","V_I_G_resistanceLeader_F","V_TacVestIR_blk"];
_this addHeadgear selectRandom ["H_Hat_camo","H_Cap_grn_BI","H_Watchcap_cbr","H_Watchcap_cbr","H_Watchcap_camo","H_ShemagOpen_tan","H_Shemag_olive","lxWS_H_ssh40_sand","lxWS_H_ssh40_green","H_PASGT_basic_olive_F"];
_this addItemToUniform "FirstAidKit";

_wepAry = selectRandom [

["arifle_AKM_FL_F",[""],[""],"30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","smokeshell","smokeshell"],
["arifle_AKM_F",[""],[""],"30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","HandGrenade","smokeshell"],
["arifle_SLR_lxWS",["","","optic_ACO","optic_ACO_grn","optic_r1_high_lxWS","optic_r1_low_lxWS","optic_MRCO","optic_Arco_black_F"],["acc_flashlight"],"30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","30Rnd_762x51_slr_lxWS","HandGrenade","smokeshell"],
["srifle_DMR_06_olive_F",["","","optic_MRCO","optic_Arco_lush_F","optic_SOS","optic_KHS_old"],["bipod_02_F_blk","bipod_03_F_blk",""],"20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","HandGrenade","smokeshell"],
["arifle_SLR_V_camo_lxWS",["","","optic_MRCO","optic_Arco_lush_F","optic_SOS","optic_KHS_old"],["acc_flashlight"],"20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","20Rnd_762x51_slr_lxWS","HandGrenade","smokeshell"],
["arifle_Katiba_F",["","optic_ACO","optic_ACO_grn","optic_r1_high_lxWS","optic_r1_low_lxWS","optic_MRCO","optic_Arco_black_F"],["acc_flashlight"],"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","HandGrenade","HandGrenade"],
["arifle_TRG21_F",["","optic_ACO","optic_ACO_grn","optic_r1_high_lxWS","optic_r1_low_lxWS","optic_MRCO","optic_Arco_lush_F"],["acc_flashlight"],"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade","HandGrenade"],
["arifle_TRG21_GL_F",["1Rnd_HE_Grenade_shell"],["acc_flashlight"],"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"],
["arifle_Mk20_GL_F",["1Rnd_HE_Grenade_shell"],["acc_flashlight"],"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"],
["arifle_Mk20_F",["","optic_ACO","optic_ACO_grn","optic_r1_high_lxWS","optic_r1_low_lxWS","optic_MRCO","optic_Arco_lush_F"],["acc_flashlight"],"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade","HandGrenade"],
["arifle_TRG20_F",["","","optic_ACO","optic_ACO_grn","optic_r1_high_lxWS","optic_r1_low_lxWS","optic_MRCO","optic_Arco_lush_F"],["acc_flashlight"],"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade","HandGrenade"],
["arifle_Mk20C_F",["","optic_ACO","optic_ACO_grn","optic_r1_high_lxWS","optic_r1_low_lxWS"],["acc_flashlight"],"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade","HandGrenade"],
["arifle_AK12_arid_F",["","optic_r1_high_arid_lxWS","optic_ACO_grn_smg","bipod_02_F_arid"],["acc_flashlight"],"30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","30rnd_762x39_Mag_F","smokeshell","smokeshell"],
["arifle_Galat_lxWS",["optic_Arco_AK_blk_F"],["acc_flashlight"],"75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F"],
["LMG_03_F",["acc_flashlight"],[""],"200Rnd_556x45_Box_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_F"],
["LMG_Mk200_F",["acc_flashlight"],["bipod_02_F_blk","bipod_03_F_blk",""],"200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box"]



];

_this addWeapon (_wepAry deleteAt 0);
_this addPrimaryWeaponItem selectRandom (_wepAry deleteAt 0);
_this addPrimaryWeaponItem selectRandom (_wepAry deleteAt 0);
_this addPrimaryWeaponItem (_wepAry deleteAt 0);
{_this addItemToVest _x} forEach _wepAry; 