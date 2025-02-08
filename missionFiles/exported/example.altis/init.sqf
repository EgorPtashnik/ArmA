startTNK = false;
startINF = false;

civDead = 0 ;
addMissionEventHandler ["EntityKilled", 
{ 
 params ["_killed", "_killer", "_instigator"]; 
 if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; if (isNull _instigator) then {_instigator = _killer};
if ((isPlayer _instigator) and (side group _killed == civilian )) then {civDead = civDead + 1; _instigator sideChat "Fuck! I think I shot civilian..."}; 
}];


if(vehicleVarName player == "adv" and (1.68117e+006 in getDLCs 1)) then {player addPrimaryWeaponItem "optic_Hamr_sand_lxWS";};
if(vehicleVarName player == "ofi") then {


removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

player addWeapon "srifle_EBR_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_MRCO";
player addPrimaryWeaponItem "20Rnd_762x51_Mag";
player addWeapon "hgun_ACPC2_F";
player addHandgunItem "9Rnd_45ACP_Mag";

player forceAddUniform "U_I_CombatUniform_shortsleeve";
player addVest "V_PlateCarrierIA1_dgtl";

player addWeapon "Binocular";

player addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {player addItemToUniform "20Rnd_762x51_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "I_IR_Grenade";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellGreen";
player addItemToVest "SmokeShellOrange";
player addItemToVest "SmokeShellPurple";
for "_i" from 1 to 2 do {player addItemToVest "Chemlight_green";};
for "_i" from 1 to 4 do {player addItemToVest "20Rnd_762x51_Mag";};
player addHeadgear "H_HelmetIA";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
};

if(vehicleVarName player == "snip" and (332350 in getDLCs 1)) then {

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

player addWeapon "srifle_EBR_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_KHS_blk";
player addPrimaryWeaponItem "20Rnd_762x51_Mag";
player addPrimaryWeaponItem "bipod_03_F_blk";
player addWeapon "hgun_ACPC2_F";
player addHandgunItem "9Rnd_45ACP_Mag";

player forceAddUniform "U_I_CombatUniform";
player addVest "V_PlateCarrierIA1_dgtl";

player addWeapon "Rangefinder";

player addItemToUniform "FirstAidKit";
player addItemToUniform "20Rnd_762x51_Mag";
player addItemToUniform "Chemlight_green";
for "_i" from 1 to 6 do {player addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellGreen";
player addItemToVest "Chemlight_green";
player addHeadgear "H_Booniehat_dgtl";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

};