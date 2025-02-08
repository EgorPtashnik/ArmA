_unit = _this select 0;
_loadout = _this select 1;

        removeAllWeapons _unit;
        removeAllItems _unit;
        removeAllAssignedItems _unit;
        removeUniform _unit;
        removeVest _unit;
        removeBackpack _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

If (_loadout == "VKS") Then
        {
                _unit forceAddUniform "U_O_SpecopsUniform_ocamo";
                _unit addItemToUniform "FirstAidKit";
                for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
                _unit addItemToUniform "SmokeShell";
                _unit addItemToUniform "SmokeShellRed";
                _unit addVest "V_HarnessOSpec_brn";
                for "_i" from 1 to 4 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
                for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_127x54_Mag";};
                for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
                _unit addHeadgear "H_HelmetO_ocamo";
                _unit addGoggles "G_Balaclava_blk";

                _unit addWeapon "srifle_DMR_04_F";
                _unit addPrimaryWeaponItem "acc_pointer_IR";
                _unit addPrimaryWeaponItem "optic_DMS";
                _unit addWeapon "hgun_Pistol_heavy_02_F";
                _unit addWeapon "Rangefinder";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
                _unit linkItem "ItemRadio";
                _unit linkItem "ItemGPS";
                _unit linkItem "NVGoggles_OPFOR";

                [_unit,"GryffinRegiment"] call bis_fnc_setUnitInsignia;
        };

If (_loadout == "Cyrus") Then
        {
                _unit forceAddUniform "U_O_SpecopsUniform_ocamo";
                _unit addItemToUniform "FirstAidKit";
                for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
                for "_i" from 1 to 4 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
                _unit addVest "V_HarnessOSpec_brn";
                for "_i" from 1 to 5 do {_unit addItemToVest "10Rnd_93x64_DMR_05_Mag";};
                for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
                _unit addItemToVest "SmokeShell";
                _unit addItemToVest "SmokeShellRed";
                _unit addHeadgear "H_HelmetO_ocamo";
                _unit addGoggles "G_Bandanna_beast";

                _unit addWeapon "srifle_DMR_05_hex_F";
                _unit addPrimaryWeaponItem "muzzle_snds_93mmg";
                _unit addPrimaryWeaponItem "optic_khs_hex";
                _unit addPrimaryWeaponItem "acc_pointer_IR";
                _unit addPrimaryWeaponItem "bipod_02_F_hex";
                _unit addWeapon "hgun_Rook40_snds_F";
                _unit addWeapon "Rangefinder";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
                _unit linkItem "ItemRadio";
                _unit linkItem "ItemGPS";
                _unit linkItem "NVGoggles_OPFOR";

                [_unit,"GryffinRegiment"] call bis_fnc_setUnitInsignia;
        };

If (_loadout == "Kangar") Then
        {
                _unit forceAddUniform "U_O_CombatUniform_ocamo";
                _unit addItemToUniform "FirstAidKit";
                for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
                for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
                _unit addVest "V_TacVest_khk";
                for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_93x64_Mag";};
                _unit addBackpack "B_AssaultPack_ocamo";
                for "_i" from 1 to 3 do {_unit addItemToBackpack "150Rnd_93x64_Mag";};
                _unit addHeadgear "H_HelmetSpecO_blk";

                _unit addWeapon "MMG_01_hex_F";
                _unit addPrimaryWeaponItem "acc_pointer_IR";
                _unit addPrimaryWeaponItem "optic_ACO_grn";
                _unit addWeapon "hgun_Rook40_F";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
                _unit linkItem "ItemRadio";
                _unit linkItem "NVGoggles_OPFOR";

                [_unit,"GryffinRegiment"] call bis_fnc_setUnitInsignia;
        };

If (_loadout == "Zafir") Then
        {
                _unit forceAddUniform "U_O_CombatUniform_ocamo";
                _unit addItemToUniform "FirstAidKit";
                for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
                for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
                _unit addVest "V_TacVest_khk";
                for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_762x54_Box";};
                _unit addBackpack "B_AssaultPack_ocamo";
                for "_i" from 1 to 3 do {_unit addItemToBackpack "150Rnd_762x54_Box";};
                _unit addHeadgear "H_HelmetSpecO_blk";

                _unit addWeapon "LMG_Zafir_F";
                _unit addPrimaryWeaponItem "acc_pointer_IR";
                _unit addPrimaryWeaponItem "optic_ACO_grn";
                _unit addWeapon "hgun_Rook40_F";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
                _unit linkItem "ItemRadio";
                _unit linkItem "NVGoggles_OPFOR";

                [_unit,"GryffinRegiment"] call bis_fnc_setUnitInsignia;
        };

If (_loadout == "M14") Then
        {
                _unit forceAddUniform "U_BG_Guerrilla_6_1";
                _unit addItemToUniform "FirstAidKit";
                for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
                _unit addItemToUniform "SmokeShell";
                _unit addItemToUniform "SmokeShellGreen";
                _unit addVest "V_Chestrig_oli";
                for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
                _unit addItemToVest "HandGrenade";
                _unit addItemToVest "MiniGrenade";
                _unit addGoggles "G_Balaclava_oli";

                _unit addWeapon "srifle_DMR_06_olive_F";
                _unit addPrimaryWeaponItem "optic_MRCO";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
                _unit linkItem "ItemRadio";
        };

If (_loadout == "Officer") Then
        {
                _unit forceAddUniform "U_BG_leader";
                _unit addItemToUniform "FirstAidKit";
                for "_i" from 1 to 5 do {_unit addItemToUniform "Chemlight_blue";};
                _unit addItemToUniform "SmokeShellYellow";
                _unit addItemToUniform "SmokeShellBlue";
                _unit addItemToUniform "SmokeShellOrange";
                _unit addVest "V_TacVest_oli";
                for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
                for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_9x21_Mag";};
                _unit addItemToVest "HandGrenade";
                _unit addHeadgear "H_Cap_oli_hs";

                _unit addWeapon "SMG_02_F";
                _unit addPrimaryWeaponItem "optic_ACO_grn_smg";
                _unit addWeapon "hgun_ACPC2_F";
                _unit addWeapon "Binocular";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
                _unit linkItem "ItemRadio";

                _unit setFace "GreekHead_A3_08";
                _unit setSpeaker "Male05GRE";
        };

If (_loadout == "DeadGuy01") Then 
        {
                _unit forceAddUniform "U_I_CombatUniform_shortsleeve";
                _unit addItemToUniform "SmokeShell";
                _unit addItemToUniform "SmokeShellGreen";
                for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
                for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
                _unit addVest "V_PlateCarrierIAGL_dgtl";
                _unit addGoggles "G_Balaclava_oli";
                                
                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
        };

If (_loadout == "DeadGuy02") Then 
        {
                _unit forceAddUniform "U_I_CombatUniform";
                _unit addItemToUniform "SmokeShellPurple";
                for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_yellow";};
                _unit addVest "V_PlateCarrierIA2_dgtl";
                _unit addHeadgear "H_Watchcap_khk";
                _unit addGoggles "G_Bandanna_oli";
                                
                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemWatch";
        };
