//[BIS_infiltratorGroup] call BIS_fnc_TO_activateUnits;

//if mortar is destroyed before task is spawned, exit and don't do anything
if(damage BIS_suppliesMortar >= 1) exitWith {};

//add event handler that deletes one of the two backpacks when the mortar is disassembled
player setVariable 
[
	"BIS_mortarDisassembleEH", 
	player addEventHandler 
	[
		"WeaponDisassembled", 
		{
			//the following code is for deleting the backpack
			//we cannot directly delete "_this select 2" but we must instead deleate its container
			//we first need to find the container that contains "_this select 2" and then delete it

			//search for nearby objects
			_temp = player nearObjects 5;

			//search for backpack's cargo among near objects
			{
				if(firstBackpack _x == (_this select 2)) then
				{
					deleteVehicle _x;
				};
			}
			forEach _temp;

			/*
			BIS_mortarDisassembled enableSimulation true;
			BIS_mortarDisassembled hideObjectGlobal false;
			BIS_mortarDisassembled allowDamage true;
			*/

			//destroy handler
			player removeEventHandler["WeaponDisassembled", player getVariable "BIS_mortarDisassembleEH"];
		}
	]
];

sleep 3;

private _handle = ["45_getMortar"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
sleep 2;

// Task: Get mortar
[
	TRUE,
	"tsk_supplies",
	[
		localize "STR_A3_TO_C03m01_tskSupplies01Desc",
		localize "STR_A3_TO_C03m01_tskSupplies01Title",
		nil
	],
	getPos BIS_suppliesMortar,
	true,
	1,
	true,
	"move",
	false
] call BIS_fnc_taskCreate;

waitUntil {
	sleep 1;
	(backpack player == "B_mortar_01_weapon_F") || {damage  BIS_suppliesMortar >= 1}
}; 

//if mortar is destroyed, the task fails
if(damage  BIS_suppliesMortar >= 1) exitWith
{
	["tsk_supplies","FAILED"] call BIS_fnc_taskSetState;
};

["tsk_supplies","SUCCEEDED"] call BIS_fnc_taskSetState;

// Task: Defend Regroup Zone
[
	TRUE,
	"tsk_supplies_2",
	[
		localize "STR_A3_TO_C03m01_tskSupplies02Desc",
		localize "STR_A3_TO_C03m01_tskSupplies02Title",
		nil
	],
	"mrk_regroup",
	true,
	1,
	true,
	"move",
	false
] call BIS_fnc_taskCreate;

waitUntil {
	sleep 1;
	triggerActivated trg_regroup && { backpack player == "B_mortar_01_weapon_F" || { "B_Mortar_01_weapon_F" in (backpackCargo (vehicle player)) } }
};

BIS_to_mortarSaved = true;

sleep 5;
["tsk_supplies_2","SUCCEEDED"] call BIS_fnc_taskSetState;
