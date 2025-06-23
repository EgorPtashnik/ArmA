
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;

_this addWeapon "arifle_Mk20_F";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "optic_MRCO";
_this addPrimaryWeaponItem "30Rnd_556x45_Stanag";
_this addWeapon "launch_MRAWS_olive_F";
_this addSecondaryWeaponItem "MRAWS_HE_F";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "9Rnd_45ACP_Mag";

_this forceAddUniform "U_I_CombatUniform";
_this addVest "V_PlateCarrierIA1_dgtl";
_this addBackpack "B_AssaultPack_dgtl";

_this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_this addItemToUniform "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_this addItemToVest "9Rnd_45ACP_Mag";};
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
for "_i" from 1 to 4 do {_this addItemToBackpack "MRAWS_HE_F";};
_this addHeadgear "H_HelmetIA";

_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";

